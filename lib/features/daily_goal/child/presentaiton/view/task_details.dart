import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';
import 'package:shalana07/features/home/child/model/child_goal_model.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';

import '../../../../../core/common/styles/global_text_style.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../core/common/widgets/custom_child_app_bar.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../home/parent/presentatrion/widgets/account_card.dart';
import '../../../../profile/parent/controller/parent_profile_controller.dart';
import 'package:get/get.dart';

class TaskDetails extends StatefulWidget {
  TaskDetails({super.key, required this.id});

  final String id;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  final ChildProfileController childProfileController = Get.put(
    ChildProfileController(),
  );
  final ChildHomeScreenController childHomeScreenController = Get.find<ChildHomeScreenController>();

  late Datum actualGoal;

  @override
  void initState() {
    super.initState();
    actualGoal = childHomeScreenController.childGoalModel.value!.data.firstWhere(
        (element) => element.goalId == widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      ////app bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(title: 'Task Detail', notificationIcon: true, image: childProfileController.childModel.value!.data.childProfile.image),
      ),

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
                        actualGoal.goal.status.toString(),
                        style: getTextStyle(
                          color: const Color(0xFFF7FBF7),
                          fontSize: 12,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                10.verticalSpace,

                //////////////////////////---------ttile -------------------//////////////
                Text(
                  actualGoal.goal.title.toString(),
                  style: getTextStyle(
                    color: const Color(0xFF161616),
                    fontSize: 22,

                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                Text(
                  actualGoal.goal.description,
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
                      'Duration: ${(actualGoal.goal.durationMin / 60).toString().split('.')[0]} h',
                      style: getTextStyle(
                        color: const Color(0xFF686868),
                        fontSize: 14,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Due: ${DateFormat('yyyy-MM-dd').format(actualGoal.goal.endDate.toLocal())}',
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
                      '${actualGoal.goal.rewardCoins} points',
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
                  '${actualGoal.goal.progressAvg}% Completed',
                  style: getTextStyle(
                    color: AppColors.grey800,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                LinearProgressIndicator(
                  value: actualGoal.goal.progress / 100,
                  minHeight: 8.h,
                  borderRadius: BorderRadius.circular(10.r),
                  backgroundColor: AppColors.grey200,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),


                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
