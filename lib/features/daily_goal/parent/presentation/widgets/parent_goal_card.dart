import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/create_goal/parent/presentation/view/parent_create_new_goal.dart';
import 'package:shalana07/features/daily_goal/parent/model/parent_goal_model.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key, required this.goal, required this.isParentVIew});

  final GoalModel goal;
  final int? isParentVIew;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0.h, bottom: 15.0.h,left: 8.w,right: 8.w),
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
                      "${goal.coinsPerDay} coins per day",
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
            children: [
              ////////Goal status
              Text(
                goal.status,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: goal.status == "Active"
                      ? AppColors.primary
                      : AppColors.secondary,
                ),
              ),
              5.verticalSpace,
              ////////Edit icon and delete icon
              ///if isParentVIew is 1 then show edit and delete icon
              if (isParentVIew == 1)
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.h),
                      child: GestureDetector(
                        onTap: () {
                          // Handle edit icon press
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>  ParentCreateNewGoal()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Edit",
                              style: getTextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey700,
                              ),
                            ),
                            5.horizontalSpace,
                            Image.asset(
                              IconPath.editIcon,
                              width: 10.w,
                              height: 10.w,
                              color: AppColors.grey700,
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.h, left: 10.0.w),
                      child: GestureDetector(
                        onTap: () {

                          // Handle delete icon press
                          
                        },
                        child: Row(
                          children: [
                            Text(
                              "Delete",
                              style: getTextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey700,
                              ),
                            ),
                            5.horizontalSpace,
                            Image.asset(
                              IconPath.deleteIcon,
                              width: 10.w,
                              height: 10.w,
                              color: AppColors.grey700,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
