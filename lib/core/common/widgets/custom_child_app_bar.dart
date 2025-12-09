import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
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
    this.image,
  });

  final String title;
  final bool isBackButtonVisible;
  final bool isAvatarVisible;
  final bool isAppBarTransparent;
  final bool isCenterTitle;
  final String? image;

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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ChildNotificationPage()),
            // );
            Get.to(() => ChildNotificationPage());
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl:
                  image ??
                  "https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper-thumbnail.png",
              width: 34.w,
              height: 34.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.primary,
                  size: 25.h,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
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
