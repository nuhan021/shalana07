import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/common/widgets/view_more.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/notification/parent/model/notification_controller.dart';
import 'package:shalana07/features/notification/parent/presentation/widgets/notification_card.dart';


//note plese read the comment for understand code
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

        //Refresh indicator
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            // Logic to refresh the page can be added here
            await Future.delayed(const Duration(seconds: 1));
          },
          
           child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            //Body start from here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top updates text
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final notification =
                        notificationController.updatesNotifications[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: NotificationCard(activity: notification),
                    );
                  },
                ),
            
                ///view more option
                Obx(() {
                  if (notificationController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ViewMoreButtton(
                      onTap: () {
                        notificationController.loadMore();
                      },
                    );
                  }
                }),
            
                20.verticalSpace,
            
                ///RewardUpdate section
                Text(
                  "Reward Updates",
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey900,
                  ),
                ),
            
            20.verticalSpace,
                ///reward updates card list
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
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
                 Obx(() {
                  if (notificationController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ViewMoreButtton(
                      onTap: () {
                        notificationController.loadMore();
                      },
                    );
                  }
                }),
          
                50.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
