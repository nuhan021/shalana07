import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';

import '../../../../core/common/widgets/item_card.dart';
import '../../../avatar/controllers/controller.dart';

class RewardDetailsScreen extends StatelessWidget {
  RewardDetailsScreen({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.coin,
  });

  final String imgUrl;
  final String title;
  final String coin;

  final AvatarScreenController avatarScreenController =
      Get.find<AvatarScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      // app bar
      appBar: CustomChildAppBar(title: 'Reward Details'),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // product image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(imgUrl),
            ),

            12.verticalSpace,

            // title and coin
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // title
                Text(
                  title,
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                // coin
                Row(
                  children: [
                    Text(
                      coin,
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    6.horizontalSpace,
                    Image.asset(IconPath.earnCoinIcon, scale: 2.6),
                  ],
                ),
              ],
            ),

            22.verticalSpace,

            // description
            Text(
              'A cheerful sunny yellow dress that brings warmth and joy to your avatar, perfect for brightening every adventure!',
              style: getTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey700,
                lineHeight: 1.5,
              ),
            ),

            25.verticalSpace,

            // buttons
            Row(
              children: [
                // favorite button
                Expanded(
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    alignment: AlignmentGeometry.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconPath.favouriteIcon, scale: 4),
                        10.horizontalSpace,
                        Text(
                          'Favorite',
                          style: getTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                20.horizontalSpace,

                // unlock button
                Expanded(
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      'Unlock',
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

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
                children: avatarScreenController.trendingItems.map((element) {
                  return ItemCard(
                    imgUrl: element.imgUrl,
                    title: element.title,
                    coin: element.coin,
                  ).marginOnly(right: 10.r);
                }).toList(),
              ),
            ),
            10.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 16.r),
      ),
    );
  }
}
