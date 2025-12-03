// forgotPassword_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/routes/app_routes.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final NetworkCaller _networkCaller = NetworkCaller();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool value) => _isLoading.value = value;

  Future<void> sendOtp() async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email.');
      return;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email.');
      return;
    }

    setLoading(true);
    final response = await _networkCaller.postRequest(
      '${Api.baseUrl}/auth/request-reset-password',
      body: {'email': email},
    );
    setLoading(false);

    if (response.isSuccess) {
      // Get.snackbar('Success', 'OTP sent successfully.');
      Get.toNamed(AppRoute.forgetOTPScreen, arguments: {'isFromSignUpScreen': false});
    } else {
      Get.snackbar('Error', response.errorMessage ?? 'Failed to send OTP.');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}