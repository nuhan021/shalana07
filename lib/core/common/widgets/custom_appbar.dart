import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/notification/presentation/view/notification_page.dart';
//note: This is a custom appbar widget
// if you add to custom appbar you need to wrap it with prefferd sized widgets
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
 required  this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBackground,
      //icons
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.grey900),
        onPressed: () {
          // Handle menu button press
        },
      ),
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
              InkWell(
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
              ),
              SizedBox(width: 10.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  ImagePath.parentProfile,
                  width: 34.w,
                  height:34.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}