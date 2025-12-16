import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/daily_goal/child/controller/Child_daily_goal_controller.dart';
import 'package:shalana07/features/daily_goal/child/model/child_goal_model.dart';
import 'package:shalana07/features/daily_goal/child/presentaiton/view/task_details.dart';
import 'package:shalana07/features/daily_goal/child/presentaiton/widgets/child_goal_card.dart';
import 'package:shalana07/features/daily_goal/parent/model/parent_goal_model.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/view/goal_details/Tast_details.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';

import '../../../../home/child/model/child_goal_model.dart';

class ChildDailyGoal extends StatelessWidget {
  ChildDailyGoal({super.key});

  //  Add scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ChildDailyGoalController controller = Get.put(
    ChildDailyGoalController(),
  );

  final ChildHomeScreenController homeScreenController =
      Get.find<ChildHomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // ✅ Attach scaffold key
      backgroundColor: AppColors.appBackground,

      //  Define your end drawer
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: CustomChildAppBar(
          title: 'Goals',
          isCenterTitle: false,
          isBackButtonVisible: false,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              Row(
                children: [
                  Obx(() {
                    return Text(
                      '${controller.goalFilter.value} Goals',
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey900,
                      ),
                    );
                  }),
                  const Spacer(),

                  PopupMenuButton<String>(
                    // 1. Define the items to show in the popup menu
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Weekly',
                          child: Text('Weekly'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Daily',
                          child: Text('Daily'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Monthly',
                          child: Text('Monthly'),
                        ),
                      ];
                    },
                    // 2. Handle the selection when a menu item is tapped
                    onSelected: (String result) {
                      controller.goalFilter.value = result;
                    },
                    // 3. Define the icon/widget that triggers the popup
                    child: Image.asset(
                      // Using the original Image.asset to maintain existing look
                      IconPath.filterIcon,
                      color: AppColors.grey900,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                ],
              ),
              Divider(height: 40.h, color: AppColors.grey200),
              //////////////=///daily goal section====/
              ///
              Obx(() {
                final goals = homeScreenController.childGoalModel.value?.data;

                late List<Datum>? dailyTask = goals
                    ?.where((e) => e.goal.type == 'DAILY')
                    .toList();

                late List<Datum>? weeklyTask = goals
                    ?.where((e) => e.goal.type == 'WEEKLY')
                    .toList();

                late List<Datum>? monthlyTask = goals
                    ?.where((e) => e.goal.type == 'MONTHLY')
                    .toList();

                // 2. Add a check for null or empty data within the Obx
                if (controller.goalFilter.value == 'Daily') {
                  if (dailyTask == null || dailyTask.isEmpty) {
                    // This handles the case where loading is false, but data is empty
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Text("No daily tasks found yet!"),
                      ),
                    );
                  }
                } else if (controller.goalFilter.value == 'Weekly') {
                  if (weeklyTask == null || weeklyTask.isEmpty) {
                    // This handles the case where loading is false, but data is empty
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Text("No Weekly tasks found yet!"),
                      ),
                    );
                  }
                } else {
                  if (monthlyTask == null || monthlyTask.isEmpty) {
                    // This handles the case where loading is false, but data is empty
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Text("No Monthly tasks found yet!"),
                      ),
                    );
                  }
                }
                final filteredGoals = controller.goalFilter.value == 'Daily'
                    ? dailyTask
                    : controller.goalFilter.value == 'Weekly'
                    ? weeklyTask
                    : monthlyTask;
                return ListView.builder(
                  itemCount: filteredGoals?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      AppHelperFunctions.navigateToScreen(
                        context,
                        TaskDetails(id: filteredGoals[index].goalId,),
                      );
                    },
                    child: ChildGoalCard(
                      goal: ChildGoalModel(
                        name: filteredGoals![index].goal.title,
                        progress: double.parse(
                          filteredGoals[index].goal.progress.toString(),
                        ),
                        coinsPerDay: filteredGoals[index].goal.rewardCoins,
                        status: filteredGoals[index].goal.status,
                        goalId: filteredGoals[index].goalId,
                      ),
                    ),
                  ),
                );
              }),

              30.verticalSpace,
              SizedBox(
                height: 50.h,

                child: CommonButton(
                  title: "Ask Parent for Help",
                  onPressed: () {},
                ),
              ),
              10.verticalSpace,
              Text(
                "Your parent will be notified with your request.",
                style: getTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey400,
                ),
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
