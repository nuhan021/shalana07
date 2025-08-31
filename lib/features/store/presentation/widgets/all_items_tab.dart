import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shalana07/features/avatar/controllers/controller.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/common/widgets/item_card.dart';
import '../../../../core/utils/constants/colors.dart';

class AllItemsTab extends StatelessWidget {
  AllItemsTab({super.key});

  final AvatarScreenController avatarScreenController = Get.find<AvatarScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          30.verticalSpace,
      
          // trending items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Text(
                'Trending Items',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      
              // see all button
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey700,
                  ),
                ),
              ),
            ],
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: avatarScreenController.trendingItems.map((
                  element,
                  ) {
                return ItemCard(
                  imgUrl: element.imgUrl,
                  title: element.title,
                  coin: element.coin,
                ).marginOnly(right: 10.r);
              }).toList(),
            ),
          ),
      
          15.verticalSpace,


          // dress items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Text(
                'Dress',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      
              // see all button
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey700,
                  ),
                ),
              ),
            ],
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: avatarScreenController.dress.map((
                  element,
                  ) {
                return ItemCard(
                  imgUrl: element.imgUrl,
                  title: element.title,
                  coin: element.coin,
                ).marginOnly(right: 10.r);
              }).toList(),
            ),
          ),


          15.verticalSpace,


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Text(
                'Dress',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // see all button
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey700,
                  ),
                ),
              ),
            ],
          ),
          // hair items
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: avatarScreenController.hair.map((
                  element,
                  ) {
                return ItemCard(
                  imgUrl: element.imgUrl,
                  title: element.title,
                  coin: element.coin,
                ).marginOnly(right: 10.r);
              }).toList(),
            ),
          ),

        ],
      ),
    );
  }
}
