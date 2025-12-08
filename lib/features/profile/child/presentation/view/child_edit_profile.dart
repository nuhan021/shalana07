// child_edit_profile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/profile/child/controller/child_edit_profile_controller.dart';
import 'package:shalana07/features/profile/model/child_model.dart';

class ChildEditProfile extends StatelessWidget {
  final ChildModel model;

  const ChildEditProfile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChildEditProfileController());
    controller.loadChildData(model);

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          title: 'Edit Profile',
          notificationIcon: true,
          profileIcon: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15.0,
          bottom: 15.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title("Name"),
              10.verticalSpace,
              CustomTextField(
                isfilled: true,
                controller: controller.nameController,
              ),
              20.verticalSpace,

              _title("Phone Number"),
              10.verticalSpace,
              CustomTextField(
                isfilled: true,
                controller: controller.phoneController,
              ),
              20.verticalSpace,

              _title("Email"),
              10.verticalSpace,
              CustomTextField(
                isfilled: true,
                controller: controller.emailController,
              ),
              20.verticalSpace,

              _title("Relation"),
              10.verticalSpace,
              CustomTextField(
                isfilled: true,
                controller: controller.relationController,
              ),
              20.verticalSpace,

              _title("City"),
              10.verticalSpace,
              Obx(() {
                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select a city'),
                  value: controller.cities.contains(controller.selectedCity.value)
                      ? controller.selectedCity.value
                      : null,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: controller.cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectedCity.value = value ?? '';
                    controller.locationController.text = value ?? '';
                  },
                );
              }),
              50.verticalSpace,

              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      backgroundColor: Colors.transparent,
                      textColor: AppColors.primary,
                      isbporderColor: true,
                      title: "Cancel",
                      onPressed: () => Get.back(),
                    ),
                  ),
                  20.horizontalSpace,
                  Obx(
                    () => Expanded(
                      child: CommonButton(
                        title: controller.isLoading.value
                            ? "Saving..."
                            : "Save",
                        onPressed: () {
                          if (!controller.isLoading.value) {
                            controller.saveProfile();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Text _title(String title) {
    return Text(
      "$title*",
      style: getTextStyle(
        color: AppColors.grey900,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
