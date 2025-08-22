import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/create_goal/parent/controller/create_newgoal_Controller.dart';

class ParentCreateNewGoal extends StatelessWidget {
  ParentCreateNewGoal({super.key});
  final CreateNewgoalController _controller = Get.put(
    CreateNewgoalController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      // AppBar of create new goal screen
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: CustomAppBar(title: 'Create New Goal'),
      ),

      // Body of create new goal screen
      body: Padding(
        padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w, top: 15.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            //goal type
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
                  border: Border.all(color: AppColors.grey200, width: 1.0.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildToggle(0, "Daily"),
                    _buildToggle(1, "Weekly"),
                    _buildToggle(3, "Monthly"),
                  ],
                ),
              );
            }),
            20.verticalSpace,

            //goal creating section
            Obx(() {
              switch (_controller.selectedIndex.value) {
                // Display different sections based on selected index
                case 0:
                  return DailyGoalSection();
                case 1:
                  return Text('Assign to Child *', style: getTextStyle());
                case 2:
                  return Text(
                    'Assign to Child *',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey900,
                    ),
                  );
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
    );
  }

  _buildToggle(int index, String title) {
    final isSelected = _controller.selectedIndex.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _controller.changeIndex(index);
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

class DailyGoalSection extends StatelessWidget {
  const DailyGoalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Assign to*',
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        
          //Drop down for selecting child
          
          
          
        ),

        
      ],
    );
  }
}
