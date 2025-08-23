import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/notification/parent/model/notification_controller.dart';
import 'package:shalana07/features/notification/parent/presentation/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  final NotificationController notificationController = Get.put(
    NotificationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      //notification appbar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(title: 'Notifications', notificationIcon: false),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top mupdates text
            Text(
              "Updates",
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.grey900,
              ),
            ),

            20.verticalSpace,
            //notificatrion updates card list
            ListView.builder(
              itemCount: notificationController.updatesNotifications.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final notification =
                    notificationController.updatesNotifications[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: NotificationCard(activity: notification),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
