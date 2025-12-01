import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/logging/logger.dart';

import '../../../core/utils/helpers/app_helper.dart';
import '../../../routes/app_routes.dart';
import '../presentation/views/otp_page.dart';

class SignupController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();
  RxBool isSignupLoading = false.obs;
  RxBool isOtpLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();


  bool validateInputs() {
    // Name
    if (nameController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Name cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Phone Number
    if (numberController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Phone number cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Email
    if (emailController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Email cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Password
    if (passwordController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Password cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Confirm Password
    if (confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Confirm password cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Password match check
    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      Get.snackbar(
        "Error",
        "Password and confirm password must match",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }


  Future<void> signUp(BuildContext context) async {
    if (!validateInputs()) return;

    isSignupLoading.value = true;

    final response = await _networkCaller.postRequest(
      "${Api.baseUrl}/auth/create-parent",
       body: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "name": nameController.text.trim(),
          "phone": numberController.text.trim(),
        }
    );

    isSignupLoading.value = false;

    if(!response.isSuccess) {
      Get.snackbar('Error', response.errorMessage);
      return;
    }

    AppLoggerHelper.debug("The actual response is : ${response.responseData}");

    AppHelperFunctions.navigateToScreen(context, OtpPage(isFromSignUpScreen: true,));
    Get.snackbar('Success', "OTP Sent Successfully");
  }

  Future<void> verifyOtp(bool isFromSignUpScreen) async {
    isOtpLoading.value = true;

    if(otpController.text.isEmpty || otpController.text.length !=5) {
      Get.snackbar('Error', "Please provide a valid OTP");
      return;
    }

    final response = await _networkCaller.postRequest(
      "${Api.baseUrl}/auth/verify-otp",
      body: {
        "email": emailController.text.trim(),
        "otp": otpController.text.trim(),
      }
    );

    isOtpLoading.value = false;

    if(!response.isSuccess) {
      Get.snackbar('Error', response.errorMessage);
      return;
    }

    Get.snackbar('Success', 'OTP verify successfully');

    isFromSignUpScreen
        ? Get.toNamed(AppRoute.getLoginScreen())
        : Get.toNamed(AppRoute.setNewPasswordScreen);
  }

}