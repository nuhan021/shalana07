import 'package:flutter/material.dart' show TextEditingController, Colors;
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/auth/model/child_login_model.dart';
import 'package:shalana07/features/auth/model/user_login_model.dart';
import 'package:shalana07/routes/app_routes.dart';

NetworkCaller networkCaller = NetworkCaller();

class Logincontroller extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    userRole.value = await StorageService.role();
  }


  Rx<UserLoginModel?> loginUserModel = Rx<UserLoginModel?>(null);

  Rx<ChildLoginModel?> loginChildModel = Rx<ChildLoginModel?>(null);


  RxBool isLoginLoading = false.obs;




  //obsecure text for password field
  var isObscure = true.obs;
  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }


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
        "email": email,
        "password": pass,
      }
    );
    if(response.isSuccess){
       Get.snackbar("Login Success", response.errorMessage, colorText: AppColors.green100
       );
        isLoginLoading.value = false;
    }

   


    if (!response.isSuccess) {
      Get.snackbar("Login Failed", response.errorMessage, colorText: AppColors.error);
      return;
    }


    if(response.responseData['data']['user']['role'] == 'CHILD') {
      final model = ChildLoginModel.fromJson(response.responseData);
      loginChildModel.value = model;

      await StorageService.saveRefreshToken(model.data.refreshToken, model.data.user.id);
      await StorageService.saveToken(model.data.accessToken, model.data.user.id);
      await StorageService.setRole(model.data.user.role.toLowerCase());

    } else {
      final model = UserLoginModel.fromJson(response.responseData);
      loginUserModel.value = model;

      await StorageService.saveRefreshToken(model.data.refreshToken, model.data.user.id);
      await StorageService.saveToken(model.data.accessToken, model.data.user.id);
      await StorageService.setRole(model.data.user.role.toLowerCase());
    }




    // userRole.value = model.data.user.role.toLowerCase();

    userRole.value = await StorageService.role();



    Get.offAllNamed(AppRoute.getAppBottomNavBarScreen());


  }

  
 

}
