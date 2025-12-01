import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/profile/parent/controller/parent_profile_controller.dart';

import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/storage_service.dart';

class CreateNewgoalController extends GetxController {

  final NetworkCaller _networkCaller = NetworkCaller();

  @override
  void onInit() {
    super.onInit();

    final ParentProfileController parentProfileController = Get.find<ParentProfileController>();
    final parent = parentProfileController.parentModel.value?.data.parentProfile;

    parent?.children.map((child) {
      assignTo.add({
        "id": child.id,
        "name": child.name
      });
    }).toList();
  }

  //text controllers for goal title and description
  final TextEditingController goalTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RxBool isCreateNewGoalLoading = false.obs;

  //observable for selected goal type
  var selectedIndex = 0.obs;
  //observable for selected duration
  var selectedDuration = ''.obs;

  //observable for reward points
  RxInt rewardPoints = 0.obs;

  //Date picker controller
  var selectedDate = Rxn<DateTime>();
  //time picker controller
  var selectedTime = Rxn<TimeOfDay>();

  String goalType = "DAILY";
  //asign to children dropdown
  final List<Map<String, String>> assignTo = [];


  String? addSelectedChildId(String name) {
    final Map<String, String> matchingChild = assignTo.firstWhere(
          (child) => child['name'] == name,
      orElse: () => {},
    );
    return matchingChild['id'];
  }

  //duration dropdown
  final List<String> duration = [
    "30 minutes",
    "1 hour",
    "2 hours",
    "3 hours",
    "4 hours",
    "5 hours",
  ];
  //observable for selected child
  var selectedChild = ''.obs;

  void changeIndex(int index, String title) {
    goalType = title;
    selectedIndex.value = index;
  }
  
  //funtion of dropdown
  void changeduration(String value) {
    selectedDuration.value = value;
  }
  //function to change reward points
  void changeRewardPoints(int points) {
    rewardPoints.value = points;
  } 

  // funtion create time picker
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
    }

  }

  // function to create time picker
  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now(),
    );

    if (picked != null) {
      selectedTime.value = picked;
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    // Create a DateTime object for easy formatting (like adding leading zero)
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    // You can use the intl package for locale-aware formatting:
    // import 'package:intl/intl.dart';
    // return DateFormat.jm().format(dateTime); // e.g., "10:18 AM"

    // Or a simple manual format for HH:MM:
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }


  Future<void> createDailyNewGoad() async {
    isCreateNewGoalLoading.value = true;
    final param = {
      "title": goalTitleController.text,
      "description": descriptionController.text,
      "type": goalType,
      "rewardCoins": rewardPoints.value,
      "startDate": selectedDate.value!.toUtc().toIso8601String(),
      "endDate": selectedDate.value!.toUtc().toIso8601String(),
      "durationMin": int.parse(selectedDuration.value.split(' ')[0]) * 60,
      "assignedChildIds": [addSelectedChildId(selectedChild.value)]
    };

    final token = StorageService.token;


    var response = await _networkCaller.postRequest(
      "${Api.baseUrl}/goals/create-goal",
      body: param,
      token: token
    );

    if(response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if(await tokenService.refreshToken()) {
        response = await _networkCaller.postRequest(
            "${Api.baseUrl}/goals/create-goal",
            body: param,
            token: token
        );
      }
    }

    isCreateNewGoalLoading.value = false;

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Success message
      Get.snackbar(
        "Success",
        "Crate Goal Success",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      // Error message
      Get.snackbar(
        "Error",
        "Failed to create goal",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
