import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';

class LinkAccountCard extends StatelessWidget {
  const LinkAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //avater
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0.r),
          child: Image.asset(
            ImagePath.childAvatar,
            width: 50.w,
            height: 50.w,
            fit: BoxFit.cover,
          ),
        ),
        // Name and other details
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Name
              Text(
                'Calista Kimimela',
                style: getTextStyle(
                  fontSize: 14,
                  color: AppColors.grey900,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.verticalSpace,
              // degination
              Row(
                children: [
                  Text(
                    'Daughter · child profile',
                    style: getTextStyle(
                      fontSize: 12,
                      color: AppColors.grey500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //ontap icon
        GestureDetector(
          onTap: () {
            // Handle navigation to child profile
            // Navigator.pushNamed(context, '/childProfile');
          },
          child: Image.asset(
            IconPath.arrowForwardIcon,
            width: 18.w,
            height: 18.w,
          ),
        ),
      ],
    );
  }
}
