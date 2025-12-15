import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/common/widgets/item_card.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../avatar/controllers/controller.dart';
import '../../controller/store_controller.dart';

class DressTab extends StatelessWidget {
  DressTab({super.key});

  final AvatarScreenController avatarScreenController =
  Get.find<AvatarScreenController>();

  final StoreController storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Loading state
      if (storeController.dressItemsLoading.value) {
        return Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: AppColors.primary,
            size: 25.h,
          ),
        );
      }

      // Error state
      if (storeController.dressItemsError.value) {
        return Center(
          child: IconButton(
            onPressed: () {
              storeController.getStoreItems(itemName: StoreItems.dress);
            },
            icon: const Icon(Icons.refresh),
          ),
        );
      }

      // Empty state check (optional but recommended)
      if (storeController.dressItems.value == null ||
          storeController.dressItems.value!.data.isEmpty) {
        return Center(
          child: Text(
            'No dress items available',
            style: TextStyle(fontSize: 16.sp, color: AppColors.grey700),
          ),
        );
      }

      // Success state - Grid view
      return GridView.builder(
        padding: EdgeInsets.only(top: 10.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.6,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
        ),
        itemCount: storeController.dressItems.value!.data.length,
        itemBuilder: (context, index) {
          final item = storeController.trendingItems.value!.data[index];
          return ItemCard(
            id: item.id,
            type: item.style.styleName,
            imgUrl: item.assetImage,
            title: item.gender,
            coin: item.price.toString(),
          );
        },
      );
    });
  }
}
