import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/avatar/presentation/widgets/show_image.dart';
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';

class ChangeHairStyle extends StatelessWidget {
  const ChangeHairStyle({super.key, required this.controller});

  final CustomizeAvatarController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // hair style
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 10.r),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.grey400, width: 0.5),
            ),
          ),

          child: Row(
            children: [
              // title
              Text(
                'Style: ',
                style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Obx(() {

                  final hair = controller.customizeAvatarModel.value?.data.hair;
                  if (hair == null || hair.elements == null || hair.elements!.isEmpty) {
                    return const SizedBox();
                  }

                  return Row(
                    children: List.generate(
                        hair.elements!.length,
                      (index) {
                        final element = hair.elements![index];
                        final firstColor = element.colors.isNotEmpty
                            ? element.colors.first
                            : null;

                        final isUnlocked = firstColor?.isUnlocked ?? false;
                        return GestureDetector(
                          onTap: () {
                            if (!isUnlocked) {
                              Get.snackbar(
                                'Locked',
                                'Unlock this style for ${firstColor?.price ?? 0} coins',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                            controller.changeHairStyle(index);
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    controller.selectedHairStyleIndex.value ==
                                        index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: ShowImage(
                              image: controller
                                  .totalElements
                                  .value!
                                  .hair
                                  .elements[index]
                                  .colors
                                  .first,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),

        // hair color selection row
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 10.r),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.grey400, width: 0.5),
            ),
          ),
          child: Row(
            children: [
              // title
              Text(
                'Color: ',
                style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 10.w),
              Obx(() {
                final hairElement = controller.totalElements.value!.hair.elements[controller.selectedHairStyleIndex.value];
                final colorDetails = hairElement.colorDetails ?? [];
                return Expanded(
                  child: Row(
                    children: List.generate(
                      controller
                          .totalElements
                          .value!
                          .hair
                          .elements[controller.selectedHairStyleIndex.value]
                          .colors
                          .length,
                      (index) {
                        final colorDetail = colorDetails[index];
                        final isUnlocked = colorDetail.isUnlocked;

                        return GestureDetector(
                          onTap: () {
                            if (!isUnlocked) {
                              Get.snackbar(
                                'Locked',
                                'Unlock this color for ${colorDetail.price} coins',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                            controller.changeSelectedHairColor(index);
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    controller.selectedHairColorIndex.value ==
                                        index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Stack(
                              children: [ShowImage(
                                image: controller
                                    .totalElements
                                    .value!
                                    .hair
                                    .elements[controller
                                        .selectedHairStyleIndex
                                        .value]
                                    .colors[index],
                              ),

                                if(!isUnlocked)
                                  Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey400.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.lock, color: AppColors.grey400, size: 15,),
                                    ),
                                  )

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
