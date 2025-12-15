import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shalana07/core/common/widgets/item_card.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../avatar/controllers/controller.dart';
import '../../controller/store_controller.dart';

class AvatarTab extends StatelessWidget {
  AvatarTab({super.key});

  final AvatarScreenController avatarScreenController =
      Get.find<AvatarScreenController>();

  final StoreController storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Loading state
      if (storeController.avatarItemsLoading.value) {
        return Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: AppColors.primary,
            size: 25.h,
          ),
        );
      }

      // Error state
      if (storeController.avatarItemsError.value) {
        return Center(
          child: IconButton(
            onPressed: () {
              storeController.getStoreItems(itemName: StoreItems.avatar);
            },
            icon: const Icon(Icons.refresh),
          ),
        );
      }

      // Empty state check (optional but recommended)
      if (storeController.avatarItems.value == null ||
          storeController.avatarItems.value!.data.isEmpty) {
        return Center(
          child: Text(
            'No avatar items available',
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
        itemCount: storeController.avatarItems.value!.data.length,
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
