import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/core/utils/constants/icon_path.dart';
import 'package:shalana07/features/profile/parent/controller/add_child_account_controller.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/add_child_image.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/custom_switch.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/setting_section.dart';

class AddChildAccount extends StatelessWidget {
  AddChildAccount({super.key});
  final AddChildAccountController controller = Get.put(
    AddChildAccountController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(title: "Add Account", notificationIcon: true),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /////////////============add Image section=============////////////
             AddImageOption(controller: controller),
              20.verticalSpace,
              //////////////////Textfeild section//////////////
              _addAccount("Account Name*"),
              10.verticalSpace,
              CustomTextField(
                hintText: "Calista Kimimela",
                isfilled: true,
                controller: TextEditingController(),
              ),
              24.verticalSpace,

              _addAccount("Phone Number"),
              10.verticalSpace,
              CustomTextField(
                hintText: "(262) 724-3679",
                isfilled: true,
                controller: TextEditingController(),
              ),
              20.verticalSpace,

              _addAccount("Account Email*"),
              10.verticalSpace,
              CustomTextField(
                hintText: "calista.kimi@gmail.com",
                isfilled: true,
                controller: TextEditingController(),
              ),

              20.verticalSpace,
              _addAccount("Date of Birth*"),
              10.verticalSpace,
              CustomTextField(
                hintText: "23 January, 2012",
                isfilled: true,
                suffixIcons: Icon(Icons.calendar_month_outlined),
                controller: TextEditingController(),
              ),

              20.verticalSpace,
              _addAccount("Relationship"),
              10.verticalSpace,
              CustomTextField(
                hintText: "Mother",
                isfilled: true,
                controller: TextEditingController(),
              ),

              20.verticalSpace,
              // Inside your widget build method
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _addAccount("Account Type"),
                  10.verticalSpace,

                  Obx(() {
                    return DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      icon: Icon(Icons.keyboard_arrow_down),
                      hint: const Text("Select Account Type"),
                      value: controller.selectedAccountType.value.isEmpty
                          ? null
                          : controller.selectedAccountType.value,
                      items: controller.accountTypes
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedAccountType.value = value;
                        }
                      },
                    );
                  }),

                  20.verticalSpace,
                  _addAccount("Location*"),
                  10.verticalSpace,

                  Obx(() {
                    return DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,

                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      icon: Icon(Icons.keyboard_arrow_down),
                      hint: const Text("Select Location"),
                      value: controller.selectedLocation.value.isEmpty
                          ? null
                          : controller.selectedLocation.value,
                      items: controller.locations
                          .map(
                            (loc) =>
                                DropdownMenuItem(value: loc, child: Text(loc)),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedLocation.value = value;
                        }
                      },
                    );
                  }),
                ],
              ),
              //set permission
              30.verticalSpace,
              Text(
                "Set Permission",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  color: AppColors.grey900,
                  fontSize: 18,

                  fontWeight: FontWeight.w600,
                ),
              ),
              20.verticalSpace,





              /////////////setting section//////////////
              
              ////////////////////////////full access////////////
             SettingSection(controller: controller),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Text _addAccount(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: getTextStyle(
        color: AppColors.grey900,
        fontSize: 16,

        fontWeight: FontWeight.w500,
      ),
    );
  }
}


