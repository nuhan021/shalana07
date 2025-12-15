import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/create_goal/child/controller/child_create_new_goal_controller.dart';
import 'package:shalana07/features/create_goal/parent/controller/create_newgoal_Controller.dart';
import 'package:shalana07/features/create_goal/parent/presentation/widgets/add_remove_button.dart';

class ChildDailyGoalSection extends StatelessWidget {
  ChildDailyGoalSection({super.key, this.isFromUpdateSection = false});

  final bool isFromUpdateSection;

  final ChildCreateNewGoalController controller =
  Get.find<ChildCreateNewGoalController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///children selection section
        Text(
          'Assign to*',
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),
        10.verticalSpace,

        //Drop down for selecting child
        Obx(
              () => DropdownButtonFormField<String>(
            isExpanded: true,
            borderRadius: BorderRadius.circular(10.0.r),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white100,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 5.0.h,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
                borderSide: BorderSide(width: 0.5, color: AppColors.grey600),
              ),
            ),
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.grey900,
            ),
            value: controller.selectedChild.value.isEmpty
                ? null
                : controller.selectedChild.value,
            hint: const Text('Select Child'),
            items: controller.assignTo
                .map(
                  (item) => DropdownMenuItem(
                value: item["name"],
                child: Text(item["name"]!),
              ),
            )
                .toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                controller.selectedChild.value = newValue;
              }
            },
          ),
        ),

        20.verticalSpace,

        //Select date section
        Text(
          'Select Date *',
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),

        10.verticalSpace,

        //Date picker button
        Obx(
              () => GestureDetector(
            onTap: () {
              controller.pickDate(context);
            },
            child: Container(
              height: 42.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),

              //decorator for date picker button
              decoration: BoxDecoration(
                color: AppColors.white100,

                borderRadius: BorderRadius.circular(10.0.r),
                border: Border.all(color: AppColors.grey600, width: 0.5.w),
              ),
              child: Row(
                children: [
                  // Date display
                  Text(
                    controller.selectedDate.value != null
                        ? '${controller.selectedDate.value!.toLocal()}'.split(
                      ' ',
                    )[0]
                        : '__/__/____',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey900,
                    ),
                  ),
                  Spacer(),

                  // Calendar icon
                  Image.asset(IconPath.calanderIcon, scale: 4),
                ],
              ),
            ),
          ),
        ),

        20.verticalSpace,

        //Select time section
        Text(
          'Select Time *',
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),

        10.verticalSpace,
        Obx(
              () => GestureDetector(
            onTap: () {
              controller.pickTime(context);
            },
            child: Container(
              height: 42.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),

              //decorator for date picker button
              decoration: BoxDecoration(
                color: AppColors.white100,

                borderRadius: BorderRadius.circular(10.0.r),
                border: Border.all(color: AppColors.grey600, width: 0.5.w),
              ),
              child: Row(
                children: [
                  // Date display
                  Text(
                    controller.selectedTime.value != null
                        ? controller.formatTimeOfDay(
                      controller.selectedTime.value!,
                    ) // <-- USE THE FORMAT FUNCTION HERE
                        : '00:00',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey900,
                    ),
                  ),
                  Spacer(),

                  // Calendar icon
                  Image.asset(IconPath.timerIcon, scale: 4),
                ],
              ),
            ),
          ),
        ),

        //dropdown for duration selection
        20.verticalSpace,

        Text(
          'Select Duration *',
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),
        //Drop down for selecting duration
        10.verticalSpace,
        Obx(
              () => DropdownButtonFormField<String>(
            isExpanded: true,
            borderRadius: BorderRadius.circular(10.0.r),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white100,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 5.0.h,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
                borderSide: BorderSide(width: 0.5, color: AppColors.grey600),
              ),
            ),
            dropdownColor: Colors.white,
            icon: Image.asset(
              IconPath.dropdownandup,
              scale: 4,
              color: AppColors.grey900,
            ),
            value: controller.selectedDuration.value.isEmpty
                ? null
                : controller.selectedDuration.value,
            hint: const Text('0.00 hours'),
            items: controller.duration
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (newvalue) {
              if (newvalue != null) {
                controller.changeduration(newvalue);
              }
            },
          ),
        ),

        20.verticalSpace,

        ///Reward section
        Text(
          'Reward *',
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),

        // Reward input field
        10.verticalSpace,

        Obx(() {
          return Container(
            height: 42.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            decoration: BoxDecoration(
              color: AppColors.white100,
              borderRadius: BorderRadius.circular(10.0.r),
              border: Border.all(color: AppColors.grey600, width: 0.5.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //decreasing and increasing reward buttons
                AddAndRemove(
                  image: IconPath.removeIcon,
                  onTap: () => controller.changeRewardPoints(
                    controller.rewardPoints.value - 10,
                  ),
                ),
                Text(
                  "${controller.rewardPoints.value} Points",
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey900,
                  ),
                ),
                // Add icon for increasing reward
                AddAndRemove(
                  image: IconPath.navbarAddICon,
                  onTap: () {
                    controller.changeRewardPoints(
                      controller.rewardPoints.value + 10,
                    );
                  },
                ),
              ],
            ),
          );
        }),

        20.verticalSpace,

        //submit And cancel button
        Row(
          children: [
            Expanded(
              child: CommonButton(
                title: 'Cancel',
                isLinearGradient: false,
                isbporderColor: true,

                textColor: AppColors.primary,
                backgroundColor: Colors.transparent,

                onPressed: () {
                  // Clear all fields
                  controller.goalTitleController.clear();
                  controller.descriptionController.clear();
                  controller.selectedChild.value = '';
                  controller.selectedDate.value = null;
                  controller.selectedTime.value = null;
                  controller.selectedDuration.value = '';
                  controller.selectedDuration.value = '';
                },
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Obx(() {
                if (controller.isCreateNewGoalLoading.value) {
                  return Container(
                    height: 50.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                }
                return CommonButton(
                  title: isFromUpdateSection ? 'Update' : 'Create',
                  onPressed: () {
                    if(isFromUpdateSection) {
                      controller.updateGoal(controller.goalId.value);
                    } else {
                      controller.createDailyNewGoad();
                    }
                  },
                );
              }),
            ),
          ],
        ),
        //fotter section
        50.verticalSpace,
      ],
    );
  }
}
