import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/change_avatar/controller/change_avatar_controller.dart';
import 'package:shalana07/features/change_avatar/presentation/widgets/avatar_card.dart';
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';

import '../../../avatar/controllers/controller.dart';

class ChangeAvatarScreen extends StatelessWidget {
  ChangeAvatarScreen({super.key});

  final ChangeAvatarController changeAvatarController = Get.put(
    ChangeAvatarController(),
  );

  final CustomizeAvatarController controller = Get.put(
    CustomizeAvatarController(),
  );

  AvatarScreenController avatarScreenController = Get.put(
    AvatarScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    final List<Widget> avatarCards = List.generate(controller.avatars.length, (
      index,
    ) {
      final item = controller.avatars[index];
      DressStyle currentDressStyle = item.dress.elements.first;
      JewelryStyle currentJewelryStyle = item.jewelry.elements.first;
      HairStyle currentHairStyle = item.hair.elements.first;

      return AvatarCard(
        index: index,
        avatarImgUrl: item.avatarImgUrl,
        currentDressStyle: currentDressStyle.colors.first,
        currentJewelryStyle: currentJewelryStyle.colors.first,
        currentHairStyle: currentHairStyle.colors.first,
      );
    });

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      // app bar
      appBar: CustomChildAppBar(title: 'Change Avatar'),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,

          // title
          Text(
            'Search Avatar',
            style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          20.verticalSpace,

          // select gender and region
          Row(
            children: [
              // gender selection
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ).paddingOnly(bottom: 8.r),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.grey400),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return Text(
                              changeAvatarController.selectedGender.value
                                  .toString(),
                              style: getTextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.grey300,
                              ),
                            );
                          }),

                          PopupMenuButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.grey400,
                            ),
                            surfaceTintColor: AppColors.primary,
                            onSelected: (value) {
                              changeAvatarController.selectedGender.value =
                                  value;
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem<String>(
                                  value: 'male',
                                  child: Text('Male'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'female',
                                  child: Text('Female'),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              20.horizontalSpace,

              // country selection
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Region',
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ).paddingOnly(bottom: 8.r),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.grey400),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return Text(
                              changeAvatarController.selectedRegion.value
                                  .toString(),
                              style: getTextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.grey300,
                              ),
                            );
                          }),
                          PopupMenuButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.grey400,
                            ),
                            surfaceTintColor: AppColors.primary,
                            onSelected: (value) {
                              changeAvatarController.selectedRegion.value =
                                  value;
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem<String>(
                                  value: 'USA',
                                  child: Text('USA'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'UK',
                                  child: Text('UK'),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // region selection
            ],
          ),

          // find button
          30.verticalSpace,

          CommonButton(title: 'Find', onPressed: () {}),

          30.verticalSpace,

          Text(
            'Owned Avatars',
            style: getTextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),

          25.verticalSpace,

          // Column(
          //   children: AppHelperFunctions.wrapWidgets(
          //     avatarCards,
          //     2,
          //     verticalSpacing: 24.h,
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Ensures a single row
                mainAxisSpacing: 24.r,
                crossAxisSpacing: 13.r,
              ),

              itemCount: avatarScreenController.currentAvatar.value!.data.unequipped.length,

              itemBuilder: (context, index) {
                final item = avatarScreenController.currentAvatar.value!.data.unequipped[index];

                // null check করে নিন
                String dressUrl = '';
                if (item.dress.elements != null && item.dress.elements!.isNotEmpty) {
                  dressUrl = item.dress.elements!.first.colors.first.url;
                }

                String jewelryUrl = '';
                if (item.jewelry.elements != null && item.jewelry.elements!.isNotEmpty) {
                  jewelryUrl = item.jewelry.elements!.first.colors.first.url;
                }

                String hairUrl = '';
                if (item.hair.elements != null && item.hair.elements!.isNotEmpty) {
                  hairUrl = item.hair.elements!.first.colors.first.url;
                }
                return AvatarCard(
                  avatarImgUrl: item.avatarImgUrl,
                  currentDressStyle: dressUrl,
                  currentJewelryStyle: jewelryUrl,
                  currentHairStyle: hairUrl,
                  index: index,
                );
              },
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
