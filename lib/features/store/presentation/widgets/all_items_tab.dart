import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/features/avatar/controllers/controller.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/common/widgets/item_card.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../controller/store_controller.dart';

class AllItemsTab extends StatelessWidget {
  AllItemsTab({super.key, required this.tabController});

  final TabController tabController;

  final AvatarScreenController avatarScreenController = Get.put(
    AvatarScreenController(),
  );

  final StoreController storeController = Get.find<StoreController>();

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
                style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              // see all button
              TextButton(
                onPressed: () {
                  tabController.index = 1;
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

          Obx(() {
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

          15.verticalSpace,

          // dress items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Text(
                'Dress',
                style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              // see all button
              TextButton(
                onPressed: () {
                  tabController.index = 3;
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

          Obx(() {
            if (storeController.dressItemsLoading.value) {
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: AppColors.primary,
                  size: 25.h,
                ),
              );
            }
            if (storeController.dressItemsError.value) {
              return Center(
                child: IconButton(
                  onPressed: () {
                    storeController.getStoreItems(itemName: StoreItems.dress);
                  },
                  icon: Icon(Icons.refresh),
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: storeController.dressItems.value!.data.map((element) {
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

          15.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Text(
                'Hair',
                style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              // see all button
              TextButton(
                onPressed: () {
                  tabController.index = 4;
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
          // hair items
          Obx(() {
            if (storeController.hairItemsLoading.value) {
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: AppColors.primary,
                  size: 25.h,
                ),
              );
            }
            if (storeController.hairItemsError.value) {
              return Center(
                child: IconButton(
                  onPressed: () {
                    storeController.getStoreItems(itemName: StoreItems.hair);
                  },
                  icon: Icon(Icons.refresh),
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: storeController.hairItems.value!.data.map((element) {
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

          15.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Text(
                'Avatar',
                style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              // see all button
              TextButton(
                onPressed: () {
                  tabController.index = 2;
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
          // Avatar items
          Obx(() {
            if (storeController.avatarItemsLoading.value) {
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: AppColors.primary,
                  size: 25.h,
                ),
              );
            }
            if (storeController.avatarItemsError.value) {
              return Center(
                child: IconButton(
                  onPressed: () {
                    storeController.getStoreItems(itemName: StoreItems.avatar);
                  },
                  icon: Icon(Icons.refresh),
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: storeController.avatarItems.value!.data.map((
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
        ],
      ),
    );
  }
}
