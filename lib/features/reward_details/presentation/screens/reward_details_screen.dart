import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/avatar/presentation/widgets/show_image.dart';
import 'package:shalana07/features/reward_details/controller/reward_controller.dart';

import '../../../../core/common/widgets/item_card.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../avatar/controllers/controller.dart';
import '../../../bottom_nav_bar/controller/navaber_controller.dart';
import '../../../store/controller/store_controller.dart';

class RewardDetailsScreen extends StatelessWidget {
  RewardDetailsScreen({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.coin,
    required this.type,
  });

  final String id;
  final String imgUrl;
  final String title;
  final String coin;
  final String type;

  final AvatarScreenController avatarScreenController =
      Get.find<AvatarScreenController>();

  final StoreController storeController = Get.find<StoreController>();
  NavaberController navaberController = Get.find<NavaberController>();
  final RewardController controller = Get.put(RewardController());

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
              child: ShowImage(image: imgUrl),
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
            Row(
              children: [
                Text(
                  type,
                  textAlign: TextAlign.start,
                  style: getTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey700,
                    lineHeight: 1.5,
                  ),
                ),
              ],
            ),

            25.verticalSpace,

            // buttons
            Row(
              children: [
                // favorite button
                // Expanded(
                //   child: Container(
                //     height: 48.h,
                //     decoration: BoxDecoration(
                //       border: Border.all(color: AppColors.primary),
                //       borderRadius: BorderRadius.circular(25.r),
                //     ),
                //     alignment: AlignmentGeometry.center,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Image.asset(IconPath.favouriteIcon, scale: 4),
                //         10.horizontalSpace,
                //         Text(
                //           'Favorite',
                //           style: getTextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.w500,
                //             color: AppColors.primary,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // 20.horizontalSpace,

                // unlock button
                Expanded(
                  child: Obx(() {
                    if(controller.isUnlockLoading.value) {
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
                    return GestureDetector(
                      onTap: () {
                        controller.unlockAssets(id);
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        alignment: AlignmentGeometry.center,
                        child: Text(
                         controller.isUnlocked.value ? 'Unlocked' : 'Unlock',
                          style: getTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
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
                  onPressed: () {
                    navaberController.jumpToScreen(3);
                  },
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
            SizedBox(
              width: double.maxFinite,
              child: Obx(() {
                if (storeController.trendingItemsLoading.value) {
                  return Center(
                    child: LoadingAnimationWidget.dotsTriangle(
                      color: AppColors.primary,
                      size: 25.h,
                    ),
                  );
                }
                if (storeController.trendingItemsError.value) {
                  return Center(
                    child: IconButton(
                      onPressed: () {
                        storeController.getStoreItems(
                          itemName: StoreItems.trending,
                        );
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: storeController.trendingItems.value!.data.map((
                      element,
                    ) {
                      return ItemCard(
                        id: element.id,
                        type: element.style.styleName,
                        imgUrl: element.assetImage,
                        title: element.gender,
                        coin: element.price.toString(),
                      ).marginOnly(right: 10.r);
                    }).toList(),
                  ),
                );
              }),
            ),
            10.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 16.r),
      ),
    );
  }
}
