import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';

class ChildHomeDailyTask extends StatelessWidget {
  const ChildHomeDailyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ChildTaskCard(taskName: 'Reading For 30 Min. ', coin: '10', percentage: 60),
      ChildTaskCard(taskName: 'Reading For 30 Min. ', coin: '10', percentage: 0),
      ChildTaskCard(taskName: 'Reading For 30 Min. ', coin: '10', percentage: 100),
      ChildTaskCard(taskName: 'Reading For 30 Min. ', coin: '10', percentage: 55),
      ChildTaskCard(taskName: 'Reading For 30 Min. ', coin: '10', percentage: 5),
    ]);
  }
}

class ChildTaskCard extends StatelessWidget {
  const ChildTaskCard({
    super.key,
    required this.taskName,
    required this.coin,
    required this.percentage,
  });

  final String taskName;
  final String coin;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      padding: EdgeInsets.symmetric(vertical: 16.r),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.grey400, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // progress bar
          // CircularPercentIndicator(
          //   radius: 30.0,
          //   lineWidth: 5.0,
          //   percent: percentage / 100,
          //   center: Text(
          //     "${percentage.toInt().toString()}%",
          //     style: getTextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          //   ),
          //   progressColor: Colors.green,
          // ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50.w,
                height: 50.w,
                child: CircularProgressIndicator(
                  value: percentage / 100,
                  strokeWidth: 4.0.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green
                  ),
                  backgroundColor: AppColors.grey200,
                ),
              ),
              Text(
                "${percentage.toInt().toString()}%",
                  style: getTextStyle(fontSize: 13, fontWeight: FontWeight.w500)
              ),
            ],
          ),


          SizedBox(width: 10.w),

          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskName,
                style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Row(
                children: [
                  Image.asset(IconPath.earnCoinIcon, height: 14.h, width: 14.w),
                  Text(
                    'Earn $coin Stars.',
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey500,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(vertical: 2.r),

          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                percentage.toInt() == 100 ? 'Complete' : percentage.toInt() == 0 ? 'Pending' : 'In Progress',
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color:percentage.toInt() == 0 ? AppColors.secondary : AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
