import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/notification/parent/presentation/view/notification_page.dart';
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
  });
  final String title;
  final bool? notificationIcon;
  final bool? profileIcon;
  final bool? backArrowIcon;
  final Logincontroller loginController = Get.put(Logincontroller());
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
                Get.back();
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
                        child: Image.asset(
                          Logincontroller().userRole.value == "parent"
                              ? ImagePath.parentProfile
                              : ImagePath.childAvatar,
                          width: 34.w,
                          height: 34.w,
                          fit: BoxFit.cover,
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
