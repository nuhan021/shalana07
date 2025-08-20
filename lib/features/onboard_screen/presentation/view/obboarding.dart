import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/routes/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(
            left: 20.0.w,
            right: 20.0.w,
            bottom: 20.0.h,
          ),
          child: Column(
            children: [
              // Top section with logo
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 50,
                   
                  ),
                  child: Image.asset(
                    ImagePath.splash,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.45,
                    alignment: Alignment.center,
                  ),
                ),
              ),
          
              // Bottom section with title and action button
              Image.asset(
                IconPath.lightIcon,
                height: 40.w,
                width: 40.w,
                fit: BoxFit.cover,
              ),
              10.verticalSpace,
              Text(
                'Welcome to Light',
                style: getTextStyle(
                  color: AppColors.grey900,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              10.verticalSpace,
              Text(
                "Set fun goals with your parents, complete daily tasks, and earn coins to unlock cool outfits, pets, and more for your avatar. Let’s grow, learn, and shine together!",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  color: AppColors.grey500,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  lineHeight: 1.5,
                ),
              ),

              80.verticalSpace,
               
               CommonButton(title: 'Get Started', onPressed: () { 
               AppRoute.getLoginScreen();

                },)

            ],
          ),
        ),
      ),
    );
  }
}




class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const CommonButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      highlightColor:Colors.greenAccent,
      borderRadius: BorderRadius.circular(24.r),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
