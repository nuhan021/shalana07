import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/common/widgets/item_card.dart';
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
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      // app bar
      appBar: CustomChildAppBar(title: 'Find Avatar'),

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
                                  .toString()
                                  .toLowerCase(),
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
                                  value: 'MALE',
                                  child: Text('Male'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'FEMALE',
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
                                const PopupMenuItem<String>(
                                  value: 'Europe',
                                  child: Text('Europe'),
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

          Obx(() {
            if (changeAvatarController.selectedGender.value.isNotEmpty && changeAvatarController.selectedRegion.value.isNotEmpty) {
              if(changeAvatarController.isFindAvatarLoading.value) {
                return Center(child: LoadingAnimationWidget.dotsTriangle(color: AppColors.primary, size: 24.h),);
              }
              return CommonButton(title: 'Find', onPressed: () {
                changeAvatarController.findAvatars();
              });
            }
            return SizedBox();
          }),

          30.verticalSpace,

          Obx(() {
            if(changeAvatarController.findedAvatars.value != null) {
              return Text(
                'Avatars',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              );
            }

            return SizedBox();
          }),


          Obx(() {
            if(changeAvatarController.findedAvatars.value != null) {
              if(changeAvatarController.findedAvatars.value!.data.isEmpty){
                return Center(child: Text('No data found'),);
              }
              return Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 160.w / 230.h, // Width to Height ratio from ItemCard
                  ),
                  itemCount: changeAvatarController.findedAvatars.value!.data.length,
                  itemBuilder: (context, index) {
                    final item = changeAvatarController.findedAvatars.value!.data[index];
                    return ItemCard(imgUrl: item.avatarImgUrl, title: item.gender, coin: '100');
                  },
                ),
              );
            }

            return SizedBox();

          })
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
