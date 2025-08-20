import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/utils/constants/colors.dart';

import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/auth/presentation/widgets/backgroun.dart';
import 'package:shalana07/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final Logincontroller _logincontroller = Get.put(Logincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Background(),

          // Login form
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.66,
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        'Login',
                        style: getTextStyle(
                          color: AppColors.grey900,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        'Log in to your existing account',
                        style: getTextStyle(
                          color: AppColors.grey500,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      20.verticalSpace,

                      // Login form fields (e.g., email, password)
                      CustomTextField(
                        controller: _logincontroller.emailController,
                        hintText: 'Enter email',
                      ),

                      30.verticalSpace,
                      CustomTextField(
                        controller: _logincontroller.passwordController,
                        hintText: 'Enter Password',
                        suffixIcons: Icon(
                          Icons.visibility_outlined,
                          color: AppColors.grey300,
                        ),
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.getForgotPasswordScreen());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: getTextStyle(
                                color: AppColors.grey600,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      40.verticalSpace,

                      // Login button
                      CommonButton(
                        title: 'Log in',
                        onPressed: () {
                          Get.toNamed(AppRoute.getAppBottomNavBarScreen());
                        },
                      ),

                      //sign up section
                      40.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: getTextStyle(
                              color: AppColors.grey900,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          5.horizontalSpace,
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoute.getSignupScreen());
                            },
                            child: Text(
                              'Sign Up',
                              style: getTextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
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
          ),
        ],
      ),
    );
  }
}
