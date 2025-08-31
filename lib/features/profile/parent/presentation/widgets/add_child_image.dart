import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/profile/parent/controller/add_child_account_controller.dart';

class AddImageOption extends StatelessWidget {
  const AddImageOption({
    super.key,
    required this.controller,
  });

  final AddChildAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: const Color(0xFFE0E0E0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Obx(() {
              return GestureDetector(
                onTap: () {
                  controller.pickFromGallery();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
    
                      backgroundImage: controller.image.value != null
                          ? FileImage(
                              File(controller.image.value!.path),
                            )
                          : AssetImage(IconPath.profileAvatarIcon),
                    ),
    
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white100,
                        ),
                        child: Image.asset(
                          IconPath.editIcon,
                          scale: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
    
            10.verticalSpace,
            Center(
              child: Text(
                "Add Picture",
                style: getTextStyle(
                  color: AppColors.grey400,
                  fontSize: 16,
    
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
