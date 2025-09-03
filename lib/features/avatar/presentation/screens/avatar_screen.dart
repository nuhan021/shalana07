import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/item_card.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/avatar/controllers/controller.dart';
import 'package:shalana07/features/change_avatar/presentation/screens/change_avatar_screen.dart';
import 'package:shalana07/features/customize_avatar/presentation/screens/avatar_customize_screen.dart';
import 'package:shalana07/features/notification/child/presentation/view/child_notification_page.dart';
import 'package:shalana07/features/profile/child/presentation/view/child_profile.dart';

import '../../../bottom_nav_bar/controller/navaber_controller.dart';
import '../../../customize_avatar/controllers/customize_avatar_controller.dart';

class AvatarScreen extends StatelessWidget {
  AvatarScreen({super.key});

  AvatarScreenController avatarScreenController = Get.put(
    AvatarScreenController(),
  );

  final controller = Get.put(CustomizeAvatarController());
  NavaberController navaberController = Get.find<NavaberController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground, // default color
      // App Bar of this screen
      appBar: AppBar(
        centerTitle: false,

        title: Text(
          // title of the screen
          'Avatar',
          style: getTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),

        actions: [
          // notification icon button
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChildNotificationPage(),
                ),
              );
            },
            child: Image.asset(
              IconPath.notificationIcon,
              height: 32.h,
              color: AppColors.grey900,
            ),
          ),

          SizedBox(width: 10.w),

          // profile picture
          GestureDetector(
            onTap: () {
              AppHelperFunctions.navigateToScreen(context, ChildProfile());
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(ImagePath.childAvatar),
              backgroundColor: Colors.white,
            ).paddingOnly(right: 10.r),
          ),
        ],
      ),

      // body of the screen
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // child avatar picture container
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.primary, width: 10),
              ),
              alignment: Alignment.bottomCenter,
              child: Obx(() {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(controller.totalElements.value.avatarImgUrl),
                    Image.asset(controller.currentDressStyle),
                    Image.asset(controller.currentJewelryStyle),
                    Image.asset(controller.currentHairStyle),
                  ],
                );
              }),
            ),

            SizedBox(height: 30),

            // navigator buttons
            for (int i = 0; i < 2; i++)
              GestureDetector(
                onTap: () {
                  if (i == 1) {
                    AppHelperFunctions.navigateToScreen(
                      context,
                      AvatarCustomizeScreen(),
                    );
                  } else {
                    AppHelperFunctions.navigateToScreen(
                      context,
                      ChangeAvatarScreen(),
                    );
                  }
                },
                child: Container(
                  height: 52.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        offset: const Offset(0, 2),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                    border: Border.all(color: AppColors.grey200),
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Screen name
                      Text(
                        i == 0 ? 'Change Avatar' : 'Customize Avatar',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900,
                        ),
                      ),

                      // arrow icon
                      Image.asset(IconPath.arrowForwardIcon, height: 20.h),
                    ],
                  ),
                ).paddingOnly(bottom: 20),
              ),

            // Trending items section
            SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // top section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // title
                      Text(
                        'Trending Items',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // see all button
                      TextButton(
                        onPressed: () {navaberController.jumpToScreen(3);},
                        child: Text(
                          'See All',
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // item section
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: avatarScreenController.trendingItems.map((
                        element,
                      ) {
                        return ItemCard(
                          imgUrl: element.imgUrl,
                          title: element.title,
                          coin: element.coin,
                        ).marginOnly(right: 10.r);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ).paddingSymmetric(horizontal: 15.r),
      ),
    );
  }
}
