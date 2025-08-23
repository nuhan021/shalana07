import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';

class ViewMoreButtton extends StatelessWidget {
  const ViewMoreButtton({
    super.key, required this.onTap,
  });
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
      child: Row(
      children: [
        Expanded(child: Container(height: 1.h,color: AppColors.grey200,)),
        Text(
          "View more",
          style: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.grey600,
          ),
        ),
        Icon(Icons.keyboard_arrow_down_sharp,color: AppColors.grey600,size: 15.sp,),
        Expanded(child: Container(height: 1.h,color: AppColors.grey200,)),
      ]
      ),
    );
  }
}
