import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';

class LinkAccountCard extends StatelessWidget {
  const LinkAccountCard({super.key, required this.name, required this.relation, this.img, this.gender});

  final String name;
  final String relation;
  final String? img;
  final String? gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //avater
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0.r),
          child:CachedNetworkImage(
            imageUrl: img ?? "https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper-thumbnail.png",
            fit: BoxFit.cover,
            height: 50.h,
            width: 50.w,
            placeholder: (context, url) => Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primary,
                size: 25.h,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
                name,
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
                    '$relation · child profile',
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
