import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/create_goal/parent/controller/create_newgoal_Controller.dart';
import 'package:shalana07/features/create_goal/parent/presentation/widgets/daily_goal_section.dart';
import 'package:shalana07/features/daily_goal/parent/controller/parent_daily_goal_controller.dart';

import '../../../../daily_goal/parent/model/ParentGoalModel.dart';
import '../../../../daily_goal/parent/model/parent_goal_model.dart';
import '../../../../profile/parent/controller/parent_profile_controller.dart';
//importent note:  This is the parent create new goal screen
// It allows parents to create new goals for their children
class ParentUpdateGoal extends StatefulWidget {
  ParentUpdateGoal({super.key, required this.goal});

  final GoalModel goal;

  @override
  State<ParentUpdateGoal> createState() => _ParentUpdateGoalState();
}

class _ParentUpdateGoalState extends State<ParentUpdateGoal> {
  final CreateNewgoalController _controller = Get.put(
    CreateNewgoalController(),
  );

  final ParentDailyGoalController _dailyGoalController = Get.find<ParentDailyGoalController>();

  final ParentProfileController parentProfileController = Get.put(
    ParentProfileController(),
  );

  @override
  void initState() {
    super.initState();


    final dataList = _dailyGoalController.parentGoals.value?.data;


    if (dataList != null) {

      final Datum? findOne = dataList.where(
            (goal) => goal.id == widget.goal.id,
      ).firstOrNull;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (findOne != null) {

          _controller.goalTitleController.text = findOne.title;
          _controller.descriptionController.text = findOne.description;

          _controller.selectedChild.value = findOne.assignedChildren[0].child.name;
          _controller.selectedDate.value = findOne.startDate;
          _controller.rewardPoints.value = findOne.rewardCoins;

          _controller.goalType = findOne.type;
          _controller.selectedDuration.value = "${(findOne.durationMin / 60).toString().split('.')[0]} hour";
          _controller.goalId.value = findOne.id;
        } else {

        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      // AppBar of create new goal screen
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: CustomAppBar(title: 'Update Goal', notificationIcon: true,backArrowIcon: false, image: parentProfileController.parentModel.value?.data.parentProfile.image,),
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

                // goal type
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
                      return DailyGoalSection(isFromUpdateSection: true,); //this is the daily goal section widget

                  // Weekly goal section
                    case 1:
                      return DailyGoalSection(isFromUpdateSection: true,);
                    case 2:
                      return DailyGoalSection(isFromUpdateSection: true,);

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
