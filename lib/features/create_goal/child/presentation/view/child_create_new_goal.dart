import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/create_goal/child/controller/child_create_new_goal_controller.dart';
import 'package:shalana07/features/create_goal/child/presentation/widgets/child_daily_goal_section.dart';
import 'package:shalana07/features/create_goal/parent/controller/create_newgoal_Controller.dart';
import 'package:shalana07/features/create_goal/parent/presentation/widgets/daily_goal_section.dart';
//importent note:  This is the parent create new goal screen
// It allows parents to create new goals for their children
class ChildCreateNewGoal extends StatelessWidget {
  ChildCreateNewGoal({super.key});
  final ChildCreateNewGoalController _controller = Get.put(
    ChildCreateNewGoalController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      // AppBar of create new goal screen
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: CustomAppBar(title: 'Create New Goal', notificationIcon: true,backArrowIcon: false,),
      ),

      // Body of create new goal screen
      body: Padding(
        padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w, top: 15.0.h),
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            // Logic to refresh the page can be added here
            await Future.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///goal title and description section
                //goal title input field
                CustomTextField(
                  isfilled: true,
                  controller: _controller.goalTitleController,
                  hintText: 'Goal Title',
                ),

                //description input field
                14.verticalSpace,
                CustomTextField(
                  isfilled: true,
                  controller: _controller.descriptionController,
                  hintText: 'Description',
                  maxlines: 5,
                ),

                20.verticalSpace,

                //goal type
                Text(
                  'Goal Type *',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey900,
                  ),

                  //troggle button
                ),
                10.verticalSpace,
                Obx(() {
                  return Container(
                    height: 50.h,

                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey200,
                      borderRadius: BorderRadius.circular(30.0.r),
                      border: Border.all(
                        color: AppColors.grey200,
                        width: 1.0.w,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildToggle(0, "Daily"),
                        _buildToggle(1, "Weekly"),
                        _buildToggle(2, "Monthly"),
                      ],
                    ),
                  );
                }),
                20.verticalSpace,

                //goal creating section
                Obx(() {
                  switch (_controller.selectedIndex.value) {
                  // Daily goal section ,if you work on it go to here
                    case 0:
                      return ChildDailyGoalSection(); //this is the daily goal section widget

                  // Weekly goal section
                    case 1:
                      return ChildDailyGoalSection();
                    case 2:
                      return ChildDailyGoalSection();

                  // Monthly goal section
                    default:
                      return Text(
                        'Assign to Child *',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900,
                        ),
                      );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build toggle buttons for goal type selection
  // this is used to change the goal type
  _buildToggle(int index, String title) {
    final isSelected = _controller.selectedIndex.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _controller.changeIndex(index, title.toUpperCase());
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
