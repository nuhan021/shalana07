import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/avatar/presentation/widgets/show_image.dart';
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/avatar_customization_tab_bar.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_all_accessories.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_all_assets.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_hair_style.dart';
import 'package:shalana07/features/customize_avatar/presentation/widgets/change_jewlry.dart';

import '../../../../core/utils/constants/colors.dart';
import '../widgets/change_dress_style.dart';

class AvatarCustomizeScreen extends StatefulWidget {
  const AvatarCustomizeScreen({super.key, required this.avatarId});

  final String avatarId;

  @override
  State<AvatarCustomizeScreen> createState() => _AvatarCustomizeScreenState();
}

class _AvatarCustomizeScreenState extends State<AvatarCustomizeScreen> {
  final controller = Get.put(CustomizeAvatarController());

  @override
  void initState() {
    super.initState();
    controller.resetAll();
    controller.getAvatarCredential(id: widget.avatarId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isChangeAvatarLoading.value) {
        return LoadingAnimationWidget.dotsTriangle(color: AppColors.primary, size: 24.h);
      }
      return Scaffold(
        backgroundColor: AppColors.appBackground,
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
                      if(controller.totalElements.value!.avatarImgUrl.isNotEmpty)
                        ShowImage(image: controller.totalElements.value!.avatarImgUrl),

                      if(controller.currentDressStyle.isNotEmpty)
                        ShowImage(image: controller.currentDressStyle),

                      if(controller.currentJewelryStyle.isNotEmpty)
                        ShowImage(image: controller.currentJewelryStyle),

                      if(controller.currentHairStyle.isNotEmpty)
                        ShowImage(image: controller.currentHairStyle),
                    ],
                  );
                }),
              ),

              const SizedBox(height: 16),

              // tab bar
              AvatarCustomizationTabBar(),

              const SizedBox(height: 16),

              Obx(() {
                if (controller.selectedTab.value == 0) {
                  return // change all assets
                  ChangeAllAssets(controller: controller);
                }

                return ChangeAllAccessories(controller: controller);
              }),

              const SizedBox(height: 16),

              // avatar customize tab
              Obx(() {
                if (controller.selectedTab.value == 0) {
                  return SizedBox(
                    child: Obx(() {
                      controller.selectedAvatarObject.value;
                      if (controller.selectedAvatarObject.value == 'Hair') {
                        return ChangeHairStyle(controller: controller);
                      } else if (controller.selectedAvatarObject.value ==
                          'Dress') {
                        return ChangeDressStyle(controller: controller);
                      }

                      return SizedBox(
                        child: ChangeJewelry(controller: controller),
                      );
                    }),
                  );
                }

                return ChangeJewelry(controller: controller);
              }),

              50.verticalSpace,
              Obx(
                      () {
                        if(controller.isSaveAvatarLoading.value) {
                          return Container(
                            height: 50.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            ),
                          );
                        }
                  return CommonButton(title: 'Save', onPressed: (){
                    controller.saveAvatarCredential();
                  });
                }
              )
            ],
          ).paddingSymmetric(horizontal: 16.r),
        ),
      );
    });
  }
}
