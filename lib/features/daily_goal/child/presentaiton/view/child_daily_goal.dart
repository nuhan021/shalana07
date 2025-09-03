import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/features/daily_goal/child/controller/Child_daily_goal_controller.dart';
import 'package:shalana07/features/daily_goal/child/presentaiton/widgets/child_goal_card.dart';
import 'package:shalana07/features/daily_goal/parent/presentation/view/goal_details/Tast_details.dart';

class ChildDailyGoal extends StatelessWidget {
  ChildDailyGoal({super.key});

  //  Add scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ChildDailyGoalController controller = Get.put(
    ChildDailyGoalController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // ✅ Attach scaffold key
      backgroundColor: AppColors.appBackground,

      //  Define your end drawer

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: CustomChildAppBar(title: 'Goals', isCenterTitle: false , isBackButtonVisible: false,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              Row(
                children: [
                  Text(
                    'Weekly Goals',
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey900,
                    ),
                  ),
                  const Spacer(),

                  // Open end drawer on tap
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: Image.asset(
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
              RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () async {
                  // Logic to refresh the page can be added here
                  await Future.delayed(const Duration(seconds: 1));
                },
                child: ListView.builder(
                  itemCount: controller.goals.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      AppHelperFunctions.navigateToScreen(
                        context,
                        TastDetails(),
                      );
                    },
                    child: ChildGoalCard(goal: controller.goals[index]),
                  ),
                ),
              ),

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
              50.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
