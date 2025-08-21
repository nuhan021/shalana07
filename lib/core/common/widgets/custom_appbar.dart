import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

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
        'Home',
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
              Image.asset(
                IconPath.notificationIcon,
                width: 30.w,
                height: 30.w,
                color: AppColors.grey900,
                fit: BoxFit.cover,
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