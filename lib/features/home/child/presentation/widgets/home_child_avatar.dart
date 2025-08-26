import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../core/utils/helpers/app_helper.dart';

class HomeChildAvatar extends StatelessWidget {
  const HomeChildAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHelperFunctions.screenHeight() * 0.40.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.login),
          fit: BoxFit.cover,
        ),
      ),

      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(ImagePath.homeGirlAvatar),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(96, 179, 66, 0.0),
                      Color(0xFF60B342).withValues(alpha: 0.7), // #60B342
                    ],
                    stops: [0.75, 1.0], // 64.6% and 100%
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
