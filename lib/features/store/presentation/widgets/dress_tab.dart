import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/common/widgets/item_card.dart';
import '../../../avatar/controllers/controller.dart';

class DressTab extends StatelessWidget {
  DressTab({super.key});

  final AvatarScreenController avatarScreenController =
  Get.find<AvatarScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Ensures a single row
          childAspectRatio: 2/2.6,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w
      ),

      itemCount: avatarScreenController.dress.length,

      itemBuilder: (context, index) {
        return ItemCard(
          imgUrl: avatarScreenController.dress[index].imgUrl,
          title: avatarScreenController.dress[index].title,
          coin: avatarScreenController.dress[index].coin,
        );
      },
    ).paddingOnly(top: 10.r);
  }
}
