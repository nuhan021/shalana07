import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/profile/parent/controller/parent_profile_controller.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/helper_card.dart';

class AllHelp extends StatelessWidget {
   AllHelp({super.key});
  final ParentProfileController controller = Get.find<ParentProfileController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
      },
      child: Scaffold(
        appBar: AppBar(title: Text('All Help'),),
        body:   Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (_, index) {
                            final activity = controller.messages[index];
                            // Each activity card
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 10.0.h, // Space between each activity card
                              ),
                              child: HelperCard(activity: activity),
                            );
                          },
                        ),
        ),
      ),
    );
  }
}