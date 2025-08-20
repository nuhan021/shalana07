import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/auth/presentation/widgets/backgroun.dart';
import 'package:shalana07/routes/app_routes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Forget Password',
                        style: getTextStyle(
                          color: AppColors.grey900,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Enter the email address associated with your account, and we’ll send you an OTP to verify your identity and reset your password.",
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        color: AppColors.grey400,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        lineHeight: 1.2,
                      ),
                    ),
                    34.verticalSpace,
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
                      controller: TextEditingController(),
                      isfilled: true,
                    ),
                    30.verticalSpace,
                    CommonButton(title: "Send", onPressed: () {
                      Get.toNamed(AppRoute.forgetOTPScreen);
                    }),
                    34.verticalSpace,

                    //divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.grey300,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: Text(
                            'Or',
                            style: getTextStyle(
                              color: AppColors.grey500,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.grey300,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    34.verticalSpace,

                    //Login button
                    CommonButton(
                      backgroundColor: AppColors.appBackground,
                      isbporderColor: true,
                      textColor: AppColors.grey900,
                      title: "Login",
                      onPressed: () {
                        Get.back();
                      },
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
