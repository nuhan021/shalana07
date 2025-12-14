import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/features/customize_avatar/controllers/customize_avatar_controller.dart';

import '../../../../core/utils/constants/colors.dart';

class ChangeAllAssets extends StatelessWidget {
  const ChangeAllAssets({super.key, required this.controller});

  final CustomizeAvatarController controller;

  @override
  Widget build(BuildContext context) {
    final object = controller.totalElements;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 10.r),
      child: Obx(() {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [

              Icon(Icons.arrow_back_ios_new_rounded).paddingOnly(right: 11.r),
              // main avatar objects
              Expanded(
                child: Row(
                  children: [
                    // Hair
                    GestureDetector(
                      onTap: () {
                        controller.selectedAvatarObject.value = object.value!.hair.name;
                      },
                      child: Text(
                        object.value!.hair.name,
                        style: getTextStyle(
                          fontSize: 16,
                          color:
                              object.value!.hair.name ==
                                  controller.selectedAvatarObject.value
                              ? AppColors.primary
                              : AppColors.grey900,
                          fontWeight: FontWeight.w500,
                        ),
                      ).paddingOnly(right: 10),
                    ),


                    // dress
                    GestureDetector(
                      onTap: () {
                        controller.selectedAvatarObject.value = object.value!.dress.name;
                      },
                      child: Text(
                        object.value!.dress.name,
                        style: getTextStyle(
                          fontSize: 16,
                          color:
                          object.value!.dress.name ==
                              controller.selectedAvatarObject.value
                              ? AppColors.primary
                              : AppColors.grey900,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Icon(Icons.arrow_forward_ios_rounded).paddingOnly(left: 11.r),
            ],
          ),
        );
      }),
    );
  }
}
