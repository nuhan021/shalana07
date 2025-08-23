import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_all_assets.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_hair_style.dart';

import '../../../../core/utils/constants/colors.dart';

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
                    Image.asset(controller.currentHairStyle),
                  ],
                );
              }),
            ),

            const SizedBox(height: 16),

            // tab bar
            Container(
              height: 45.h,
              padding: EdgeInsets.all(6.r),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.grey200,
              ),
              child: Stack(
                children: [

                  Obx(() {
                    return AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      alignment: controller.selectedTab.value == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: FractionallySizedBox(
                        widthFactor: 0.5, // Takes 50% of parent width
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),

                  // Text Tabs (Always on top)
                  Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => controller.toggleIsAvatarTab(0),
                          child: Text(
                            'Avatar',
                            style: getTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.toggleIsAvatarTab(1),
                          child: Text(
                            'Accessories',
                            style: getTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // change all assets
            ChangeAllAssets(controller: controller),

            const SizedBox(height: 16),

            // change hair style
            ChangeHairStyle(controller: controller),
          ],
        ).paddingSymmetric(horizontal: 16.r),
      ),
    );
  }
}
