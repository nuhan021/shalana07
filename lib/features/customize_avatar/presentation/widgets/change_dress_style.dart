import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../controllers/customize_avatar_controller.dart';

class ChangeDressStyle extends StatelessWidget {
  const ChangeDressStyle({super.key, required this.controller});

  final CustomizeAvatarController controller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // dress style
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
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: Obx(() {
                return Row(
                  children: List.generate(controller.totalElements.value.dress.elements.length, (
                      index,
                      ) {
                    return GestureDetector(
                      onTap: () {
                        controller.changeDressStyle(index);
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color:
                              controller.selectedDressStyleIndex.value ==
                                  index
                                  ? AppColors.primary
                                  : Colors.transparent,
                              width: 2
                          ),
                        ),
                        child: Image.asset(
                          controller.totalElements.value.dress.elements[index].colors.first,
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),

      // dress color selection row
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
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10.w),
            Obx(() {
              return Expanded(
                child: Row(
                  children: List.generate(
                    controller
                        .totalElements.value.dress.elements[controller.selectedDressStyleIndex.value]
                        .colors
                        .length,
                        (index) {
                      return GestureDetector(
                        onTap: () {
                          controller.changeSelectedDressColor(index);
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                controller.selectedDressColorIndex.value ==
                                    index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            controller
                                .totalElements.value.dress.elements[controller
                                .selectedDressStyleIndex
                                .value]
                                .colors[index],
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
    ]);
  }
}
