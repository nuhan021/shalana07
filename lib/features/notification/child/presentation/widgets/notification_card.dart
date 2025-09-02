import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/notification/child/controller/notification_controller.dart';
import 'package:shalana07/features/notification/child/model/notification_model.dart' show ChildNotificationModel;



class ChildNotificationCard extends StatelessWidget {
  ChildNotificationCard({super.key, required this.activity});
  // Using the controller to access messages
  final ChildNotificationController controller = Get.find<ChildNotificationController>();
  final   ChildNotificationModel activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.w),
      decoration: BoxDecoration(
        color: activity.isRead == true
            ? AppColors.white100
            : AppColors.green900,
        borderRadius: BorderRadius.circular(10.0.r),
        border: Border.all(
          color: activity.isRead == true
              ? AppColors.grey200
              : AppColors.green900,
          width: 1.0.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar image
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0.r),
            child: Image.asset(
              activity.avatar,
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          10.horizontalSpace,

          // Name and other details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //challange Name
                Text(
                  activity.challengeName,
                  style: getTextStyle(
                    fontSize: 14,
                    color: AppColors.grey900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                5.verticalSpace,
                // Description
                Text(
                  activity.childName,

                  style: getTextStyle(
                    fontSize: 12,
                    color: AppColors.grey900,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                10.verticalSpace,

                //if any massage from child
                Text(
                  activity.message,
                  style: getTextStyle(
                    fontSize: 10,

                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                // time and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Today · 10:30 AM',
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
        ],
      ),
    );
  }
}
