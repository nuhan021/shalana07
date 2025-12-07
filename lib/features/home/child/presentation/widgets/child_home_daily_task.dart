import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';
import 'package:shalana07/features/home/child/model/child_goal_model.dart';

class ChildHomeDailyTask extends StatelessWidget {
  const ChildHomeDailyTask({super.key, required this.controller});

  final ChildHomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final goals = controller.childGoalModel.value?.data;

      late List<Datum>? dailyTask = goals?.where(
            (e) => e.goal.type == 'DAILY',
      ).toList();

      late List<Datum>? weeklyTask = goals?.where(
            (e) => e.goal.type == 'WEEKLY',
      ).toList();

      // 2. Add a check for null or empty data within the Obx
      if(controller.selectedTab.value == 0) {
        if (dailyTask == null || dailyTask.isEmpty) {
          // This handles the case where loading is false, but data is empty
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text("No daily tasks found yet!"),
            ),
          );
        }
      } else {
        if (weeklyTask == null || weeklyTask.isEmpty) {
          // This handles the case where loading is false, but data is empty
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text("No weekly tasks found yet!"),
            ),
          );
        }
      }

      // 3. Render the list using the safely extracted 'goals' list
      return Column(
        children: [

          if(controller.selectedTab.value == 0)
          ...?dailyTask?.map(
                (goal) => ChildTaskCard(
              taskName: goal.goal.title,
              coin: goal.goal.rewardCoins.toString(),
              // Ensure the progress is correctly treated as a double
              percentage: (goal.goal.progress is double)
                  ? goal.goal.progress as double
                  : double.parse(goal.goal.progress.toString()),
            ),
          )
          else ...?weeklyTask?.map(
                (goal) => ChildTaskCard(
              taskName: goal.goal.title,
              coin: goal.goal.rewardCoins.toString(),
              // Ensure the progress is correctly treated as a double
              percentage: (goal.goal.progress is double)
                  ? goal.goal.progress as double
                  : double.parse(goal.goal.progress.toString()),
            ),
          )
        ],
      );
    });
  }
}

class ChildTaskCard extends StatelessWidget {
  const ChildTaskCard({
    super.key,
    required this.taskName,
    required this.coin,
    required this.percentage,
  });

  final String taskName;
  final String coin;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      padding: EdgeInsets.symmetric(vertical: 16.r),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.grey400, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // progress bar
          // CircularPercentIndicator(
          //   radius: 30.0,
          //   lineWidth: 5.0,
          //   percent: percentage / 100,
          //   center: Text(
          //     "${percentage.toInt().toString()}%",
          //     style: getTextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          //   ),
          //   progressColor: Colors.green,
          // ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50.w,
                height: 50.w,
                child: CircularProgressIndicator(
                  value: percentage / 100,
                  strokeWidth: 4.0.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green
                  ),
                  backgroundColor: AppColors.grey200,
                ),
              ),
              Text(
                "${percentage.toInt().toString()}%",
                  style: getTextStyle(fontSize: 13, fontWeight: FontWeight.w500)
              ),
            ],
          ),


          SizedBox(width: 10.w),

          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskName,
                style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Row(
                children: [
                  Image.asset(IconPath.earnCoinIcon, height: 14.h, width: 14.w),
                  Text(
                    'Earn $coin Stars.',
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey500,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(vertical: 2.r),

          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                percentage.toInt() == 100 ? 'Complete' : percentage.toInt() == 0 ? 'Pending' : 'In Progress',
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color:percentage.toInt() == 0 ? AppColors.secondary : AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
