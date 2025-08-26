import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';

import '../../../../../core/common/styles/global_text_style.dart';
import '../../../../../core/utils/constants/colors.dart';

class ChildHomeTaskTabBar extends StatelessWidget {
  ChildHomeTaskTabBar({super.key});

  final ChildHomeScreenController controller =
      Get.put(ChildHomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.all(6.r),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.grey200,
      ),
      child: Stack(
        children: [
          Obx(() {
            return AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: controller.selectedTab.value == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 0.5, // Takes 50% of parent width
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),

          // Text Tabs (Always on top)
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => controller.toggleIsAvatarTab(0),
                  child: Text(
                    'Daily Task',
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.toggleIsAvatarTab(1),
                  child: Text(
                    'Weekly Goals',
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
