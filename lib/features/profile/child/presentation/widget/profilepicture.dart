import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';

class Profilepicture extends StatelessWidget {
  const Profilepicture({super.key, required this.controller});

  final ChildProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: GestureDetector(
          onTap: () {
            controller.pickImageFromGallery();
          },
          child: Stack(
            children: [
              controller.selectedImagePath.value.isEmpty
                  ? CircleAvatar(
                      radius: 60.r,
                      backgroundImage: AssetImage(ImagePath.childAvatar),
                    )
                  : CircleAvatar(
                      radius: 60.r,
                      backgroundImage: FileImage(
                        File(controller.selectedImagePath.value),
                      ),
                    ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white100,
                  ),
                  child: Image.asset(IconPath.editIcon, scale: 3),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
