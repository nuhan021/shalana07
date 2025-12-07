import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/bottom_nav_bar/controller/navaber_controller.dart';
import 'package:shalana07/features/create_goal/child/presentation/view/child_create_new_goal.dart';
import 'package:shalana07/features/create_goal/parent/presentation/view/parent_create_new_goal.dart';
import 'package:shalana07/features/create_goal/parent/presentation/view/parent_update_goal.dart';
import 'package:shalana07/features/daily_goal/parent/controller/parent_daily_goal_controller.dart';
import 'package:shalana07/features/daily_goal/parent/model/ParentGoalModel.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/widgets/parent_goal_card.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';
import 'package:shalana07/features/home/parent/presentatrion/widgets/account_card.dart';

import '../../../../../profile/parent/controller/parent_profile_controller.dart';
import '../../../model/parent_goal_model.dart';

class TastDetails extends StatefulWidget {
  TastDetails({super.key, this.isParentVIew, required this.goal});

  final int? isParentVIew;
  final GoalModel goal;

  @override
  State<TastDetails> createState() => _TastDetailsState();
}

class _TastDetailsState extends State<TastDetails> {
  late Datum actualGoal;

  @override
  void initState() {
    super.initState();
    actualGoal = _controller.parentGoals.value!.data.firstWhere(
          (element) => element.id == widget.goal.id,
    );
  }

  final _controller = Get.put(ParentDailyGoalController());
  final ParentProfileController parentProfileController = Get.put(
    ParentProfileController(),
  );

  final NavaberController navaberController = Get.find<NavaberController>();

  @override
  Widget build(BuildContext context) {
    AppLoggerHelper.debug(actualGoal.endDate.toString());
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      ////app bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(title: 'Task Detail', notificationIcon: true, image: parentProfileController.parentModel.value?.data.parentProfile.image,),
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
                        actualGoal.status.toString(),
                        style: getTextStyle(
                          color: const Color(0xFFF7FBF7),
                          fontSize: 12,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    //////////////======edit and delete button==========//////
                    if (widget.isParentVIew == 1)
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
                                    builder: (context) =>
                                        ParentUpdateGoal(goal: widget.goal),
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
                  actualGoal.title.toString(),
                  style: getTextStyle(
                    color: const Color(0xFF161616),
                    fontSize: 22,

                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                Text(
                  actualGoal.description,
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
                      'Duration: ${(actualGoal.durationMin / 60).toString().split('.')[0]} h',
                      style: getTextStyle(
                        color: const Color(0xFF686868),
                        fontSize: 14,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Due: ${DateFormat('yyyy-MM-dd').format(actualGoal.endDate.toLocal())}',
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
                    Image.asset(
                      IconPath.earnCoinIcon,
                      height: 14.w,
                      width: 14.w,
                    ),
                    Text(
                      '${actualGoal.rewardCoins} points',
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
                  '${actualGoal.averageProgress}% Completed',
                  style: getTextStyle(
                    color: AppColors.grey800,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                LinearProgressIndicator(
                  value: actualGoal.averageProgress / 100,
                  minHeight: 8.h,
                  borderRadius: BorderRadius.circular(10.r),
                  backgroundColor: AppColors.grey200,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),

                20.verticalSpace,

                ///Assigned to
                Text(
                  'Assigned to',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                24.verticalSpace,

                // Linked accounts list
                LinkAccountCard(
                  img: actualGoal.assignedChildren.first.child.image,
                  name: actualGoal.assignedChildren.first.child.name,
                  relation: actualGoal.assignedChildren.first.child.relation,
                ),

                24.verticalSpace,

                Text(
                  'Similar Tasks',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                20.verticalSpace,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.goals.length,
                  itemBuilder: (context, index) {
                    return GoalCard(
                      goal: _controller.goals[index],
                      isParentVIew: widget.isParentVIew,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
