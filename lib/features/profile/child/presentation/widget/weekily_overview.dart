import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';

class WeeeklyOVerview extends StatelessWidget {
  const WeeeklyOVerview({super.key, required this.title, required this.sub});

  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: const Color(0xFFA7A7A7)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      child: Column(
        children: [
          Text(
            title,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.grey900,
            ),
          ),
          20.verticalSpace,
          Text(
            sub,
            style: getTextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.grey900,
            ),
          ),
        ],
      ),
    );
  }
}
