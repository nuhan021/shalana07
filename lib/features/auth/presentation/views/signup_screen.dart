import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/auth/presentation/widgets/backgroun.dart';
import 'package:shalana07/routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Background(),

          // Signup form
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.74,
              width: double.infinity,
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
                    // Title
                    Text(
                      'Sign Up',
                      style: getTextStyle(
                        color: AppColors.grey900,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Register to create new account',
                      style: getTextStyle(
                        color: AppColors.grey500,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    //  signup form fields here
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Your Name',
                    ),
                    24.verticalSpace,

                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Mobile Number',
                    ),
                    24.verticalSpace,
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Email Address',
                    ),
                    24.verticalSpace,
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Your password',
                      suffixIcons: Icon(
                        Icons.visibility_outlined,
                        color: AppColors.grey300,
                      ),
                    ),
                    24.verticalSpace,
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Confirm Password',
                      suffixIcons: Icon(
                        Icons.visibility_outlined,
                        color: AppColors.grey300,
                      ),
                    ),
                    30.verticalSpace,
                    // Signup button
                    CommonButton(
                      title: 'Sign Up',
                      onPressed: () {
                        // Handle signup logic here
                        Get.toNamed(AppRoute.getLoginScreen());
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
