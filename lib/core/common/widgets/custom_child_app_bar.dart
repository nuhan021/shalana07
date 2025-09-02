import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/home/child/presentation/view/child_home_screen.dart';
import 'package:shalana07/features/notification/child/presentation/view/child_notification_page.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_profile.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/icon_path.dart';
import '../../utils/constants/image_path.dart';
import '../styles/global_text_style.dart';

class CustomChildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomChildAppBar({
    super.key,
    required this.title,
    this.isBackButtonVisible = true,
    this.isAvatarVisible = true,
    this.isAppBarTransparent = false,
    this.isCenterTitle = true,
  });

  final String title;
  final bool isBackButtonVisible;
  final bool isAvatarVisible;
  final bool isAppBarTransparent;
  final bool isCenterTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isAppBarTransparent
          ? Colors.transparent
          : AppColors.appBackground,
      centerTitle: isCenterTitle,
      leading: isBackButtonVisible
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                IconPath.arrowBackIcon,
                scale: 4,
              ), // back button
            )
          : null,
      title: Text(
        title,
        style: getTextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.grey900,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChildNotificationPage()),
            );
          },
          child: Image.asset(
            IconPath.notificationIcon,
            height: 32.h,
            color: AppColors.grey900,
          ),
        ),
        SizedBox(width: 10.w),
        isAvatarVisible
            ? GestureDetector(
                onTap: () {
                  AppHelperFunctions.navigateToScreen(context, ChildProfile());
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(ImagePath.childAvatar),
                  backgroundColor: Colors.white,
                ).paddingOnly(right: 10.r),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
