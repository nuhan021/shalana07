import 'package:flutter/material.dart' show TextEditingController, Colors;
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/auth/model/ChildModel.dart';
import 'package:shalana07/features/auth/model/user_model.dart';
import 'package:shalana07/routes/app_routes.dart';

NetworkCaller networkCaller = NetworkCaller();

class Logincontroller extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    userRole.value = await StorageService.role();
  }


  Rx<UserModel?> userModel = Rx<UserModel?>(null);

  Rx<ChildModel?> childModel = Rx<ChildModel?>(null);


  RxBool isLoginLoading = false.obs;




  //obsecure text for password field
  var isObscure = true.obs;
  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  // Hardcoded credentials
  // final String parentEmail = "parent@gmail.com";
  // final String parentPass = "1234";
  //
  // final String childEmail = "child@gmail.com";
  // final String childPass = "1234";

  var userRole = "".obs; // parent / child
  // Text controllers for email and password fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //login function to check credentials and navigate
  Future<void> login() async {
    isLoginLoading.value = true;
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();



    final response = await networkCaller.postRequest(
      "${Api.baseUrl}/auth/login",
      body: {
        // "email": 'child3@gmail.com',
        "email": "289ydgc9cv@daouse.com",
        "password": "123456",
      }
    );

    isLoginLoading.value = false;


    if (!response.isSuccess) {
      Get.snackbar("Login Failed", response.errorMessage, colorText: AppColors.error);
      return;
    }


    if(response.responseData['data']['user']['role'] == 'CHILD') {
      final model = ChildModel.fromJson(response.responseData);

      childModel.value = model;

      await StorageService.saveRefreshToken(model.data.refreshToken, model.data.user.id);
      await StorageService.saveToken(model.data.accessToken, model.data.user.id);
      await StorageService.setRole(model.data.user.role.toLowerCase());

    } else {
      final model = UserModel.fromJson(response.responseData);
      userModel.value = model;

      await StorageService.saveRefreshToken(model.data.refreshToken, model.data.user.id);
      await StorageService.saveToken(model.data.accessToken, model.data.user.id);
      await StorageService.setRole(model.data.user.role.toLowerCase());
    }




    // userRole.value = model.data.user.role.toLowerCase();

    userRole.value = await StorageService.role();



    Get.offAllNamed(AppRoute.getAppBottomNavBarScreen());


  }

  
 

}
