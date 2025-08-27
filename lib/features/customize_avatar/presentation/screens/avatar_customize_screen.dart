import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/avatar_customization_tab_bar.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_all_assets.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_hair_style.dart';

import '../../../../core/utils/constants/colors.dart';
import '../widgets/change_dress_style.dart';

class AvatarCustomizeScreen extends StatelessWidget {
  AvatarCustomizeScreen({super.key});
  final controller = Get.put(CustomizeAvatarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground, // default color
      // app bar
      appBar: CustomChildAppBar(title: 'Customize Avatar'),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // avatar picture section
            SizedBox(
              height: 270.h,
              width: double.maxFinite,

              child: Obx(() {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/avatar/skeleton/white_skeleton.png"),
                    Image.asset(controller.currentDressStyle),
                    Image.asset(controller.currentHairStyle),
                  ],
                );
              }),
            ),

            const SizedBox(height: 16),

            // tab bar
            AvatarCustomizationTabBar(),

            const SizedBox(height: 16),

            // change all assets
            ChangeAllAssets(controller: controller),

            const SizedBox(height: 16),


            Obx(() {
              controller.selectedAvatarObject.value;
              if (controller.selectedAvatarObject.value == 'Hair') {
                return ChangeHairStyle(controller: controller);
              } else if (controller.selectedAvatarObject.value == 'Dress') {
                return ChangeDressStyle(controller: controller);
              }

              return SizedBox();
            }),
          ],
        ).paddingSymmetric(horizontal: 16.r),
      ),
    );
  }
}
