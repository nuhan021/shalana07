import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/bottom_nav_bar/controller/navaber_controller.dart';
import 'package:shalana07/features/daily_goal/parent/controller/parent_daily_goal_controller.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/widgets/weekly_goal_section.dart';

import '../../../../profile/parent/controller/parent_profile_controller.dart';

class ParentDailyGoal extends StatelessWidget {
  ParentDailyGoal({super.key});

  final ParentDailyGoalController _controller = Get.put(
    ParentDailyGoalController(),
  );
  final ParentProfileController parentProfileController = Get.put(
    ParentProfileController(),
  );
  final NavaberController navaberController = Get.find<NavaberController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.isGoalLoading.value) {
        return Center(
          child: LoadingAnimationWidget.bouncingBall(
            color: AppColors.primary,
            size: 25.h,
          ),
        );
      }

      if (_controller.isGoalError.value) {
        return Center(
          child: TextButton(
            onPressed: () {
              _controller.getGoal();
            },
            child: Text(
              'Error!\nTry again',
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ),
        );
      }
      return Scaffold(
        key: _controller.scaffoldKey,
        backgroundColor: AppColors.appBackground,

        //daily goal app bar
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),

          child: CustomAppBar(
            title: 'Goals',
            notificationIcon: true,
            backArrowIcon: false,
            image: parentProfileController.parentModel.value?.data.parentProfile.image,
          ),
        ),

        //f  end drawer
        body: Padding(
          padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w, top: 15.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //toggle button
              Obx(() {
                return Container(
                  height: 50.h,

                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.grey200,
                    borderRadius: BorderRadius.circular(30.0.r),
                    border: Border.all(color: AppColors.grey200, width: 1.0.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildToggle(0, "Child view"),
                      _buildToggle(1, "Parent view"),
                    ],
                  ),
                );
              }),

              IconButton(
                onPressed: () async {
                  await _controller.getGoal();
                },
                icon: Icon(Icons.refresh),
              ),

              //troggle Screen
              Obx(() {
                return _controller.tabIndex.value == 0
                    ? WeeklyGoalSection(isParentVIew: 0)
                    : WeeklyGoalSection(isParentVIew: 1);
              }),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonButton(
            title: "Add New Goal",
            onPressed: () {
              navaberController.jumpToScreen(2);
            },
          ),
        ),
      );
    });
  }

  _buildToggle(int index, String title) {
    final isSelected = _controller.tabIndex.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _controller.changeTabIndex(index);
        },
        child: Container(
          padding: EdgeInsets.all(5.0.w),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.white100 : Colors.transparent,
              borderRadius: BorderRadius.circular(30.0.r),
            ),
            child: Center(
              child: Text(
                title,
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
