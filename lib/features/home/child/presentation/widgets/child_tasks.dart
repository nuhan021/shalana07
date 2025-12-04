import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/home/child/presentation/widgets/child_home_daily_task.dart';
import 'package:shalana07/features/home/child/presentation/widgets/child_home_task_tab_bar.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';

import '../../../../../core/common/widgets/item_card.dart';
import '../../../../../core/utils/helpers/app_helper.dart';
import '../../../../avatar/controllers/controller.dart';
import '../../../../bottom_nav_bar/controller/navaber_controller.dart';

class ChildTasks extends StatelessWidget {
  ChildTasks({super.key});
  AvatarScreenController avatarScreenController = Get.put(
    AvatarScreenController(),
  );

  NavaberController navaberController = Get.find<NavaberController>();
  ChildProfileController childProfileController =
      Get.find<ChildProfileController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,

      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: AppHelperFunctions.screenWidth() < 365
                  ? AppHelperFunctions.screenHeight() * 0.27
                  : AppHelperFunctions.screenWidth() < 415
                  ? AppHelperFunctions.screenHeight() * 0.37
                  : AppHelperFunctions.screenHeight() * 0.39,
            ),

            // main section
            SizedBox(
              child: Column(
                children: [
                  // task complete and coin section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.r),
                        height: 30.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.check, color: AppColors.primary),
                            Text(
                              '3/5',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey900,
                              ),
                            ),

                            Text(
                              '72%',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey300,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.r),
                        height: 30.h,
                        width: 72.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              childProfileController
                                  .childModel
                                  .value!
                                  .data
                                  .childProfile
                                  .coins
                                  .toString(),
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey900,
                              ),
                            ),

                            Image.asset(IconPath.earnCoinIcon, scale: 3),
                          ],
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16),

                  SizedBox(height: 10.h),

                  // bottom container where you put all the task , buttons and tap bar
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.r,
                      vertical: 25.r,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.appBackground,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        // coins earned weekly status
                        Container(
                          height: 42.h,
                          width: 240.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF8EEA6D), // #8EEA6D
                                Color(0xFF60B342), // #60B342
                                Color(0xFF41A41D), // #41A41D
                              ],
                              stops: [
                                -0.0569, // -5.69% (Needs to be converted to a value between 0.0 and 1.0, though negative values can work but are unusual)
                                0.5048, // 50.48%
                                1.0212, // 102.12% (Needs to be converted to a value between 0.0 and 1.0, though values > 1.0 can work)
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '200 Coins Earned This Week',
                            style: getTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        SizedBox(height: 24.h),

                        ChildHomeTaskTabBar(),

                        SizedBox(height: 24.h),

                        // all the task will be here
                        ChildHomeDailyTask(),

                        SizedBox(height: 30.h),

                        // ask parent for help-----> message section
                        CommonButton(
                          title: 'Ask Parent for Help',
                          onPressed: () {},
                        ),

                        12.verticalSpace,

                        Text(
                          'Your parent will be notified with your request.',
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey400,
                          ),
                        ),

                        30.verticalSpace,

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
                              onPressed: () {
                                navaberController.jumpToScreen(3);
                              },
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

                        // trending items
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
