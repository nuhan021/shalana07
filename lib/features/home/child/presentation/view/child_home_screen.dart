import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/home/child/presentation/widgets/child_tasks.dart';
import 'package:shalana07/features/home/child/presentation/widgets/home_child_avatar.dart';
import 'package:shalana07/features/notification/child/presentation/view/child_notification_page.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_profile.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../core/utils/helpers/app_helper.dart';

class ChildHomeScreen extends StatelessWidget {
  const ChildHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      extendBodyBehindAppBar: true,
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            AppHelperFunctions.navigateToScreen(
              context,
              ChildProfile(),
            );
          },
          child: Container(
            height: 34.h,
            width: 34.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary),
              image: DecorationImage(image: AssetImage(ImagePath.childAvatar)),
            ),
          ).paddingOnly(left: 16),
        ),

        actions: [
          InkWell(
            onTap: () {
              AppHelperFunctions.navigateToScreen(
                context,
                ChildNotificationPage(),
              );
            },
            child: Container(
              height: 35.h,
              width: 35.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),

              alignment: Alignment.center,
              child: Image.asset(
                IconPath.notificationIcon,
                color: AppColors.primary,
              ),
            ).paddingOnly(right: 16),
          ),
        ],
      ),

      body: Stack(
        children: [
          // avatar section
          Column(
            children: [
              // avatar
              HomeChildAvatar(),
              Expanded(child: SizedBox()),
            ],
          ),

          // child task
          ChildTasks(),
        ],
      ),
    );
  }
}
