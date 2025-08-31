import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shalana07/core/common/widgets/item_card.dart';

import '../../../avatar/controllers/controller.dart';

class AvatarTab extends StatelessWidget {
  AvatarTab({super.key});

  final AvatarScreenController avatarScreenController =
      Get.find<AvatarScreenController>();

  @override
  Widget build(BuildContext context) {
    // return Placeholder();
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Ensures a single row
            childAspectRatio: 2/2.6,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w
        ),

        itemCount: avatarScreenController.avatar.length,

        itemBuilder: (context, index) {
          return ItemCard(
            imgUrl: avatarScreenController.avatar[index].imgUrl,
            title: avatarScreenController.avatar[index].title,
            coin: avatarScreenController.avatar[index].coin,
          );
        },
      ),
    );
  }
}
