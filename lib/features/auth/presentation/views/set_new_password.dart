import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/auth/presentation/widgets/backgroun.dart';
import 'package:shalana07/routes/app_routes.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});

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
                        'Set New Password',
                        style: getTextStyle(
                          color: AppColors.grey900,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                   
                    34.verticalSpace,
                    Text(
                      'Enter New password',
                      style: getTextStyle(
                        color: AppColors.grey900,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.verticalSpace,
                    CustomTextField(
                      controller: TextEditingController(),
                      isfilled: true,
                    ),
                    20.verticalSpace,
                    Text(
                      'Enter New password',
                      style: getTextStyle(
                        color: AppColors.grey900,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.verticalSpace,
                    CustomTextField(
                      controller: TextEditingController(),
                      isfilled: true,
                    ),
                    30.verticalSpace,
                    CommonButton(
                      title: "Continue",
                      onPressed: () {
                        Get.toNamed(AppRoute.loginScreen);
                      },
                    ),
                    34.verticalSpace,

                   
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
