import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/auth/controller/signup_controller.dart';
import 'package:shalana07/features/auth/presentation/widgets/backgroun.dart';
import 'package:shalana07/routes/app_routes.dart';

class OtpPage extends StatelessWidget {
   OtpPage({super.key, this.isFromSignUpScreen = false});

  final bool isFromSignUpScreen;

  final SignupController controller = Get.put(SignupController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Background(),

          //forget password form
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
                        'Varification',
                        style: getTextStyle(
                          color: AppColors.grey900,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    40.verticalSpace,
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

                    //otp feild
                    OtpTextField(
                      contentPadding: EdgeInsets.zero,
                      focusedBorderColor: AppColors.primary,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      numberOfFields: 5,
                      borderRadius: BorderRadius.circular(10.0.r),
                      filled: true,
                      fillColor: AppColors.white100,
                      fieldHeight: 42.0.w,
                      fieldWidth: 42.0.w,
                      borderColor: AppColors.grey600,
                      showFieldAsBox: true,
                      onCodeChanged: (code) {
                      },
                      onSubmit: (verificationCode) {
                        controller.otpController.text = verificationCode;// when all fields are filled
                        AppLoggerHelper.debug(controller.otpController.text);
                      },
                    ),
                    30.verticalSpace,
                    // button
                    Obx(
                            () {
                              if (controller.isOtpLoading.value) {
                                return Container(
                                  height: 50.h,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }
                        return CommonButton(
                          title: "Continue",
                          onPressed: () => controller.verifyOtp(isFromSignUpScreen),
                        );
                      }
                    ),

                    //fotter
                    34.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "If you didn’t receive a code,",
                          style: getTextStyle(
                            color: AppColors.grey900,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1.2,
                          ),
                        ),
                        Text(
                          "Resend",
                          style: getTextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1.2,
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
