// otp_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/auth/controller/otp_verification_controller.dart';
import 'package:shalana07/features/auth/presentation/widgets/backgroun.dart';

class OtpPage extends StatelessWidget {
  final bool isFromSignUpScreen;

  const OtpPage({super.key, this.isFromSignUpScreen = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpVerificationController());

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.6,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.appBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0.r),
                  topRight: Radius.circular(24.0.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.0.w,
                  right: 15.0.w,
                  top: 15.0.h,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Verification',
                        style: getTextStyle(
                          color: AppColors.grey900,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    40.verticalSpace,
                    Text(
                      'Email Address',
                      style: getTextStyle(
                        color: AppColors.grey900,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.verticalSpace,
                    CustomTextField(
                      controller: controller.emailController,
                      isfilled: true,
                    ),
                    30.verticalSpace,
                    Text(
                      "Enter Verification Code",
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        color: AppColors.grey400,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        lineHeight: 1.2,
                      ),
                    ),
                    24.verticalSpace,

                    // OTP Input
                    OtpTextField(
                      numberOfFields: 5,
                      focusedBorderColor: AppColors.primary,
                      borderColor: AppColors.grey600,
                      filled: true,
                      fillColor: AppColors.white100,
                      fieldHeight: 42.0.w,
                      fieldWidth: 42.0.w,
                      borderRadius: BorderRadius.circular(10.0.r),
                      showFieldAsBox: true,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      contentPadding: EdgeInsets.zero,
                      onCodeChanged: (code) {
                        // Optional: sync live if needed (not required for onSubmit)
                      },
                      onSubmit: (code) {
                        controller.otpController.text = code;
                        controller.verifyOtp(isFromSignUpScreen); // ✅ Fixed: removed 'widget.'
                      },
                    ),
                    30.verticalSpace,

                    // Continue Button (with loading)
                    Obx(
                      () => controller.isOtpLoading.value
                          ? Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : CommonButton(
                              title: "Continue",
                              onPressed: () => controller.verifyOtp(isFromSignUpScreen), // ✅ Also fixed here
                            ),
                    ),
                    34.verticalSpace,

                    // Resend OTP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "If you didn’t receive a code, ",
                          style: getTextStyle(
                            color: AppColors.grey900,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.snackbar('Info', 'Resend OTP feature coming soon.');
                          },
                          child: Text(
                            "Resend",
                            style: getTextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}