import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/bottom_nav_bar/controller/navaber_controller.dart';
import 'package:shalana07/features/create_goal/parent/presentation/view/parent_create_new_goal.dart';
import 'package:shalana07/features/daily_goal/parent/controller/parent_daily_goal_controller.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/widgets/parent_goal_card.dart';
import 'package:shalana07/features/home/parent/presentatrion/widgets/account_card.dart';

class TastDetails extends StatelessWidget {
  final int? isParentVIew;
   TastDetails({super.key, this.isParentVIew});
  final _controller = Get.find<ParentDailyGoalController>();
  final NavaberController navaberController = Get.find<NavaberController>();
  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      ////app bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(title: 'Task Details', notificationIcon: true),
      ),

      /////////=====body=============////
      ///
      ///
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RefreshIndicator(
          ///////=====Refreesh indicator to allow pull-to-refresh functionality
          color: AppColors.primary,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //////header of body////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF60B242),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Active',
                        style: getTextStyle(
                          color: const Color(0xFFF7FBF7),
                          fontSize: 12,
            
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            
                    //////////////======edit and delete button==========//////
                    if (isParentVIew == 1)
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0.h),
                            child: GestureDetector(
                              onTap: () {
                                // Handle edit icon press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ParentCreateNewGoal(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Edit",
                                    style: getTextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.grey700,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Image.asset(
                                    IconPath.editIcon,
                                    width: 14.w,
                                    height: 14.w,
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.grey700,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Image.asset(
                                    IconPath.deleteIcon,
                                    width: 14.w,
                                    height: 14.w,
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
            
                10.verticalSpace,
            
                //////////////////////////---------ttile -------------------//////////////
                Text(
                  'Writing Challenge',
                  style: getTextStyle(
                    color: const Color(0xFF161616),
                    fontSize: 22,
            
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Write a short story about an adventure.',
                  style: getTextStyle(
                    color: const Color(0xFF60B242),
                    fontSize: 14,
            
                    fontWeight: FontWeight.w400,
                  ),
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duration: 3 days',
                      style: getTextStyle(
                        color: const Color(0xFF686868),
                        fontSize: 14,
            
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Due: August 20, 2025',
                      style: getTextStyle(
                        color: AppColors.grey600,
                        fontSize: 14,
            
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            
                20.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Reward: ',
                      style: getTextStyle(
                        color: AppColors.grey600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(IconPath.earnCoinIcon, height: 14.w, width: 14.w),
                    Text(
                      '10 points',
                      style: getTextStyle(
                        color: AppColors.grey600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            
                30.verticalSpace,
            
                ////////////========linear progress bar==========//////////
                Text(
                  '50% Completed',
                  style: getTextStyle(
                    color: AppColors.grey800,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                LinearProgressIndicator(
                  value: 0.5,
                  minHeight: 8.h,
                  borderRadius: BorderRadius.circular(10.r),
                  backgroundColor: AppColors.grey200,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
            
                20.verticalSpace,
            
                ///Assigned to
                Text(
                  'Assigned to',
                  style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                24.verticalSpace,
            
                // Linked accounts list
                LinkAccountCard(),
            
                24.verticalSpace,
            
                Text(
                  'Similar Tasks',
                  style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
            
                20.verticalSpace,
                ListView.builder(
                    shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount : _controller.goals.length,
                  itemBuilder: (context, index) {
                    return GoalCard(goal: _controller.goals[index], isParentVIew:isParentVIew,);
                  }
                  ,
                 
                
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
