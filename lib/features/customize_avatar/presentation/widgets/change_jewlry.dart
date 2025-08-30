import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../controllers/customize_avatar_controller.dart';

class ChangeJewelry extends StatelessWidget {
  const ChangeJewelry({super.key, required this.controller});

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
                  return Row(
                    children: List.generate(
                      controller.totalElements.jewelry.elements.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.changeJewelryStyle(index);
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    controller
                                            .selectedJewelryStyleIndex
                                            .value ==
                                        index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(
                              controller
                                  .totalElements
                                  .jewelry
                                  .elements[index]
                                  .colors
                                  .first, width: 100,
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
                return Expanded(
                  child: Row(
                    children: List.generate(
                      controller
                          .totalElements
                          .jewelry
                          .elements[controller.selectedJewelryStyleIndex.value]
                          .colors
                          .length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.changeSelectedJewelryColor(index);
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    controller
                                            .selectedJewelryColorIndex
                                            .value ==
                                        index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(
                              controller
                                  .totalElements
                                  .jewelry
                                  .elements[controller
                                      .selectedJewelryStyleIndex
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
      ],
    );
  }
}
