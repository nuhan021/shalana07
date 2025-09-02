import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/bottom_nav_bar/controller/navaber_controller.dart';
import 'package:shalana07/features/daily_goal/parent/controller/parent_daily_goal_controller.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/view/goal_details/Tast_details.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/widgets/parent_goal_card.dart';

class WeeklyGoalSection extends StatelessWidget {
  WeeklyGoalSection({super.key, required this.isParentVIew});

  final _controller = Get.find<ParentDailyGoalController>();
  final NavaberController navaberController = Get.find<NavaberController>();
  //optional when intrigate api we can replese it its just check is parent view or not
  //importent that parent view is editable from parent app
  final int isParentVIew;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //top section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Weekly Goal",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey900,
                ),
              ),
      
              //filter icon
              GestureDetector(
                onTap: () {
                  // Handle filter icon press
                  _controller.scaffoldKey.currentState!.openEndDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Image.asset(
                    IconPath.filterIcon,
                    width: 25.w,
                    height: 25.w,
                    color: AppColors.grey900,
                  ),
                ),
              ),
            ],
          ),
      
          //goal list section with refresh indicator
          //Refrsh indicator
          Expanded(
            child: RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                // Add your refresh logic here
                await Future.delayed(const Duration(seconds: 1));
              },
                  
              //List of goals
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: _controller.goals.length,
                itemBuilder: (context, index) {
                  final goal = _controller.goals[index];
                  return InkWell(
                      onTap: () {
                        // Handle goal card tap
                       Navigator.push(context, MaterialPageRoute(builder: (context) => TastDetails(
                        isParentVIew: isParentVIew,
                       )));
                      },
                    child: GoalCard(goal: goal, isParentVIew: isParentVIew));
                },
              ),
            ),
          ),
         
          10.verticalSpace
        ],
      ),
    );
  }
}
