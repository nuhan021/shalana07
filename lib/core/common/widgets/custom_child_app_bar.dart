import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/icon_path.dart';
import '../../utils/constants/image_path.dart';
import '../styles/global_text_style.dart';

class CustomChildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomChildAppBar({super.key, required this.title, this.isAvatarVisible = true});

  final String title;
  final bool isAvatarVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBackground,
      leading: GestureDetector(
        onTap: () {},
        child: Image.asset(IconPath.arrowBackIcon, scale: 4), // back button
      ),
      title: Text(
        title,
        style: getTextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.grey900,
        ),
      ),
      actions: [
        Image.asset(
          IconPath.notificationIcon,
          height: 32.h,
          color: AppColors.grey900,
        ),
        SizedBox(width: 10.w),
        isAvatarVisible
            ? CircleAvatar(
          backgroundImage: AssetImage(ImagePath.childAvatar),
          backgroundColor: Colors.white,
        ).paddingOnly(right: 10.r)
            : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
