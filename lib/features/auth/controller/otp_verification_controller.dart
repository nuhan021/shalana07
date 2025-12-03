// otp_verification_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/routes/app_routes.dart';

class OtpVerificationController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final NetworkCaller _networkCaller = NetworkCaller();
  final RxBool isOtpLoading = false.obs;

  Future<void> verifyOtp(bool isFromSignUpScreen) async {
    final email = emailController.text.trim();
    final otpValue = otpController.text.trim();

    // ✅ Validation with direct Get.snackbar()
    if (email.isEmpty) {
      Get.snackbar('Error', 'Email is required.');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email.');
      return;
    }

    if (otpValue.isEmpty || otpValue.length < 5) {
      Get.snackbar('Error', 'Please enter a valid 5-digit OTP.');
      return;
    }

    isOtpLoading.value = true;

    final response = await _networkCaller.postRequest(
      '${Api.baseUrl}/auth/verify-otp',
      body: {
        'email': email,
        'otp': otpValue,
      },
    );

    isOtpLoading.value = false;

    if (response.isSuccess) {
      Get.snackbar(
        'Success',
        'OTP verified successfully.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );

      try {
        await Get.offNamed(AppRoute.setNewPasswordScreen); // ✅ AppRoutes (plural)
      } catch (e) {
        Get.snackbar('Navigation Error', 'Target screen not found.');
      }
    } else {
      Get.snackbar(
        'Verification Failed',
        response.errorMessage ?? 'Invalid OTP or email.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}