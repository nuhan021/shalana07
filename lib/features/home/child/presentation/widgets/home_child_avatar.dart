import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/avatar/controllers/controller.dart';
import 'package:shalana07/features/avatar/presentation/widgets/show_image.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../core/utils/helpers/app_helper.dart';
import '../../../../customize_avatar/controllers/customize_avatar_controller.dart';

class HomeChildAvatar extends StatefulWidget {
  HomeChildAvatar({super.key});

  @override
  State<HomeChildAvatar> createState() => _HomeChildAvatarState();
}

class _HomeChildAvatarState extends State<HomeChildAvatar> {
  final controller = Get.put(CustomizeAvatarController());
  final AvatarScreenController avatarScreenController = Get.put(AvatarScreenController());

  @override
  void initState() {
    super.initState();
    avatarScreenController.getCurrentAvatar();
  }

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
                    if(avatarScreenController.isCurrentAvatarIsLoading.value) {
                      return Center(
                        child: LoadingAnimationWidget.dotsTriangle(color: AppColors.primary, size: 24.h),
                      );
                    }
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ShowImage(image: avatarScreenController.currentAvatar.value!.data.equipped.avatarImgUrl),
                        ShowImage(image: avatarScreenController.currentAvatar.value!.data.equipped.dress.elements!.first.colors.first.url),
                        ShowImage(image: avatarScreenController.currentAvatar.value!.data.equipped.jewelry.elements!.first.colors.first.url),
                        ShowImage(image: avatarScreenController.currentAvatar.value!.data.equipped.hair.elements!.first.colors.first.url),
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
