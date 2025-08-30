import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../core/utils/helpers/app_helper.dart';
import '../../../../customize_avatar/controllers/customize_avatar_controller.dart';

class HomeChildAvatar extends StatelessWidget {
  HomeChildAvatar({super.key});

  final controller = Get.put(CustomizeAvatarController());

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
                  child: Obx(() {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(controller.totalElements.value.avatarImgUrl),
                        Image.asset(controller.currentDressStyle),
                        Image.asset(controller.currentJewelryStyle),
                        Image.asset(controller.currentHairStyle),
                      ],
                    );
                  }),
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
