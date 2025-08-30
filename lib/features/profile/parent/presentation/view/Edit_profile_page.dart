import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/common/widgets/common_button.dart';
import 'package:shalana07/core/common/widgets/common_text_feild.dart';
import 'package:shalana07/core/common/widgets/custom_appbar.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/profile/parent/controller/Edit_profile_controller.dart';
import 'package:shalana07/features/profile/parent/controller/parent_profile_controller.dart';
import 'package:shalana07/features/profile/parent/presentation/view/parent_profile_screen.dart';
import 'package:awesome_location_picker/awesome_location_picker.dart';
class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final ParentProfileController controller = Get.put(ParentProfileController());
  final EditProfileController editController = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
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
              ///////////////profile section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: const Color(0xFFE0E0E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Profilesection(controller: controller),
                      10.verticalSpace,
                      Center(
                        child: Text(
                          "Change Profile",
                          style: getTextStyle(
                            color: AppColors.grey400,
                            fontSize: 16,
          
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
              /////////////==============All text section===============//////////////
              20.verticalSpace,
              _title("Name"),
              10.verticalSpace,
              CustomTextField(
                hintText: "Shalana",
                isfilled: true,
                controller: TextEditingController(),
              ),
          
              20.verticalSpace,
              _title("Phone Number"),
              10.verticalSpace,
              CustomTextField(
                hintText: "(262) 724-3679",
                isfilled: true,
                controller: TextEditingController(),
              ),
          
              20.verticalSpace,
              _title("Email"),
              10.verticalSpace,
              CustomTextField(
                hintText: "laurel@gmail.com",
                isfilled: true,
                controller: TextEditingController(),
              ),
          
              20.verticalSpace,
              _title("Password"),
              10.verticalSpace,
              CustomTextField(
                hintText: "**************",
                isfilled: true,
                controller: TextEditingController(),
              ),
          
              20.verticalSpace,
              _title("Parent "),
              10.verticalSpace,
              CustomTextField(
                hintText: "Shalana",
                isfilled: true,
                controller: TextEditingController(),
              ),

 
  20.verticalSpace,
  _title("City"),
  10.verticalSpace,
   
   Center(
        child: Obx(() {
          return DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white
            ),
            hint: Text('Select a city',
                style: getTextStyle(
                  color: AppColors.grey400,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            value: editController.selectedCity.value.isEmpty
                ? null
                : editController.selectedCity.value,
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            items: editController.cities.map((city) {
              return DropdownMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: (value) {
              editController.selectedCity.value = value ?? '';
            },
          );
        }),
      ),
     

          
          50.verticalSpace,
              Row(
                children: [
                  Expanded(child: CommonButton(
                    
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.primary,
                    isbporderColor: true,
                    title: "Cancel", onPressed: (){
                    Get.back();
                  })),
                  20.horizontalSpace,
                  Expanded(child: CommonButton(title: "Save", onPressed: (){})),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _title(title) {
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
