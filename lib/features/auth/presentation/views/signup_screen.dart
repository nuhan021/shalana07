import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/auth/controller/signup_controller.dart';
import 'package:shalana07/features/auth/presentation/views/otp_page.dart';
import 'package:shalana07/features/auth/presentation/widgets/backgroun.dart';
import 'package:shalana07/routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController signupController = Get.put(SignupController());

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
                child: SingleChildScrollView(
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
                        controller: signupController.nameController,
                        hintText: 'Your Name',
                      ),
                      24.verticalSpace,

                      CustomTextField(
                        controller: signupController.numberController,
                        hintText: 'Mobile Number',
                      ),
                      24.verticalSpace,
                      CustomTextField(
                        controller: signupController.emailController,
                        hintText: 'Email Address',
                      ),
                      24.verticalSpace,
                      CustomTextField(
                        controller: signupController.passwordController,
                        hintText: 'Your password',
                        suffixIcons: Icon(
                          Icons.visibility_outlined,
                          color: AppColors.grey300,
                        ),
                      ),
                      24.verticalSpace,
                      CustomTextField(
                        controller: signupController.confirmPasswordController,
                        hintText: 'Confirm Password',
                        suffixIcons: Icon(
                          Icons.visibility_outlined,
                          color: AppColors.grey300,
                        ),
                      ),
                      30.verticalSpace,
                      // Signup button
                      Obx(() {
                        if (signupController.isSignupLoading.value) {
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
                          title: 'Sign Up',
                          onPressed: () {
                            // Handle signup logic here
                            signupController.signUp(context);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
