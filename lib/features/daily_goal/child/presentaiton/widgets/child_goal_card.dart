import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/daily_goal/child/controller/Child_daily_goal_controller.dart';
import 'package:shalana07/features/daily_goal/child/model/child_goal_model.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';

class ChildGoalCard extends StatelessWidget {
  ChildGoalCard({super.key, required this.goal});
  final ChildGoalModel goal;
  
  final ChildDailyGoalController controller = Get.find<ChildDailyGoalController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.0.h,
        bottom: 15.0.h,
        left: 8.w,
        right: 8.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.grey200, width: 1.0.w),
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///////Goal name and progress
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50.w,
                height: 50.w,
                child: CircularProgressIndicator(
                  value: goal.progress,
                  strokeWidth: 4.0.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    goal.status == "Active"
                        ? AppColors.primary
                        : AppColors.secondary,
                  ),
                  backgroundColor: AppColors.grey200,
                ),
              ),
              Text(
                "${(goal.progress * 100).toInt()}%",
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey900,
                ),
              ),
            ],
          ),
          10.horizontalSpace,
          ////////Goal name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.name,
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey900,
                  ),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      IconPath.earnCoinIcon,
                      width: 20.w,
                      height: 20.w,
                    ),
                    10.horizontalSpace,
                    Text(
                      "${goal.coinsPerDay} coins",
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ////////Goal status
              Text(
                goal.status,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: goal.status == "Active"
                      ? AppColors.primary
                      : AppColors.secondary,
                ),
              ),
              20.verticalSpace,

              if(goal.status == 'ACTIVE')
                GestureDetector(
                  onTap: () {
                    controller.startTask(goal.goalId);
                  },
                  child: Text(
                    'Active Now',
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
