import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/custom_child_app_bar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/change_avatar/controller/change_avatar_controller.dart';

class ChangeAvatarScreen extends StatelessWidget {
  ChangeAvatarScreen({super.key});

  final ChangeAvatarController controller = Get.put(ChangeAvatarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      // app bar
      appBar: CustomChildAppBar(title: 'Change Avatar'),

      body: SingleChildScrollView(
        child: Column(
          children: [
            52.verticalSpace,

            // title
            Text(
              'Search Avatar',
              style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            // select gender and region
            Row(
              children: [
                // gender selection
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.grey400),
                    ),
                    child: PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<String>(
                            value: 'Option 1',
                            child: Text('Option 1'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 2',
                            child: Text('Option 2'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 3',
                            child: Text('Option 3'),
                          ),
                        ];
                      },
                    )
                  ),
                ),

                // region selection
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
