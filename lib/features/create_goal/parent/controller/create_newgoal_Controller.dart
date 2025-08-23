import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewgoalController extends GetxController {
  //text controllers for goal title and description
  final TextEditingController goalTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  //observable for selected goal type
  var selectedIndex = 0.obs;
  //observable for selected duration
  var selectedDuration = ''.obs;

  //observable for reward points
  var rewardPoints = 0.obs;

  //Date picker controller
  var selectedDate = Rxn<DateTime>();
  //time picker controller
  var selectedTime = Rxn<TimeOfDay>();

  //asign to children dropdown
  final List<String> assignTo = ['Child 1', 'Child 2', 'Child 3', 'Child 4'];

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

  void changeIndex(int index) {
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
}
