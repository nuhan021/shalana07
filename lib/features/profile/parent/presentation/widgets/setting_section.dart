import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart' show AppColors;
import 'package:shalana07/features/profile/parent/controller/add_child_account_controller.dart';
import 'package:shalana07/features/profile/parent/presentation/widgets/custom_switch.dart' show CustomToggle;

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
    required this.controller,
  });

  final AddChildAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
        Obx(() {
       return Container(
         padding: const EdgeInsets.all(10),
         decoration: ShapeDecoration(
           shape: RoundedRectangleBorder(
             side: BorderSide(
               width: 0.50,
               color: const Color(0xFF686868),
             ),
             borderRadius: BorderRadius.circular(10),
           ),
         ),
         child: Row(
           children: [
             Text(
               "Full Access",
               style: getTextStyle(
                 color: AppColors.grey600,
                 fontSize: 16,
    
                 fontWeight: FontWeight.w400,
               ),
             ),
    
             const Spacer(),
             CustomToggle(
               value: controller.fullAccess.value,
               onChanged: (value) {
                 controller.setFullAccess(value);
               },
             ),
           ],
         ),
       );
     }),
    
     20.verticalSpace,
    
     /////=======customization==========/////////////////
     Container(
       padding: const EdgeInsets.all(10),
       decoration: ShapeDecoration(
         shape: RoundedRectangleBorder(
           side: BorderSide(
             width: 0.50,
             color: const Color(0xFF686868),
           ),
           borderRadius: BorderRadius.circular(10),
         ),
       ),
       child: Obx(() {
         return Column(
           children: [
             Row(
               children: [
                 Text(
                   "Custom",
                   style: getTextStyle(
                     color: AppColors.grey900,
                     fontSize: 16,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   value: controller.custom.value,
                   onChanged: (value) {
                     controller.setCustom(value);
                   },
                 ),
               ],
             ),
    
             10.verticalSpace,
             Divider(color: AppColors.grey500),
             ////////////=======customization All Button==========////////////
             Row(
               children: [
                 Text(
                   "Add Account",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.addAccount.value,
                   onChanged: (value) {
                     controller.addAccount.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Access other account",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.accessOtherAccount.value,
                   onChanged: (value) {
                     controller.accessOtherAccount.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Edit Profile",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.editProfile.value,
                   onChanged: (value) {
                     controller.editProfile.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Create Goal",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.createGoal.value,
                   onChanged: (value) {
                     controller.createGoal.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Task Approvals",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.taskApprovals.value,
                   onChanged: (value) {
                     controller.taskApprovals.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Give Feedback",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.giveFeedback.value,
                   onChanged: (value) {
                     controller.giveFeedback.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Customize Avatar",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.customizeAvatar.value,
                   onChanged: (value) {
                     controller.customizeAvatar.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Delete Goals",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.deleteGoals.value,
                   onChanged: (value) {
                     controller.deleteGoals.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Unlock Rewards",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.unlockRewards.value,
                   onChanged: (value) {
                     controller.unlockRewards.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
    
             Row(
               children: [
                 Text(
                   "Delete Account",
                   style: getTextStyle(
                     color: AppColors.grey500,
                     fontSize: 14,
    
                     fontWeight: FontWeight.w500,
                   ),
                 ),
    
                 const Spacer(),
                 CustomToggle(
                   height: 24,
                   width: 46,
                   toggle: 16,
                   color: AppColors.green100,
                   value: controller.deleteAccount.value,
                   onChanged: (value) {
                     controller.deleteAccount.value = value;
                   },
                 ),
               ],
             ),
    
             Divider(color: AppColors.grey200),
           ],
         );
       }),
     ),
     ],
    );
  }
}
