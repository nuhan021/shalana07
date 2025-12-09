import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/notification/parent/presentation/view/notification_page.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';
import 'package:shalana07/features/profile/common_profile.dart';

//note: This is a custom appbar widget
// if you add to custom appbar you need to wrap it with prefferd sized widgets
class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.title,
    this.notificationIcon,
    this.profileIcon,
    this.backArrowIcon,
    this.image,
  });
  final String title;
  final bool? notificationIcon;
  final bool? profileIcon;
  final bool? backArrowIcon;
  final String? image;
  final Logincontroller loginController = Get.put(Logincontroller());
  final ChildProfileController childProfileController = Get.put(
    ChildProfileController(),
  );
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBackground,
      //icons
      leading: backArrowIcon == false
          ? SizedBox()
          : IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.grey900),
              onPressed: () {
                // Handle back button press
                Navigator.pop(context);
              },
            ),

      leadingWidth: backArrowIcon == false ? 0 : 50.w,

      centerTitle: backArrowIcon == false ? false : true,
      //title
      title: Text(
        title,
        style: getTextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.grey900,
        ),
      ),
      //actions
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.0.w),
          child: Row(
            children: [
              //notification icon showing not showing function
              notificationIcon == true
                  ? InkWell(
                      onTap: () {
                        // Handle notification icon press
                        Get.to(
                          () => NotificationPage(),
                          transition: Transition.zoom,
                        );
                      },
                      child: Image.asset(
                        IconPath.notificationIcon,
                        width: 30.w,
                        height: 30.w,
                        color: AppColors.grey900,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(width: 30.w, height: 30.w),

              SizedBox(width: 10.w),
              profileIcon == false
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        Get.to(() => CommonProfile());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl:
                              childProfileController
                                  .childModel
                                  .value
                                  ?.data
                                  .childProfile
                                  .image ??
                              "https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper-thumbnail.png",
                          width: 34.r, // ✅ .r
                          height: 34.r, // ✅ .r
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: AppColors.primary,
                              size: 25.h,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
