import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateNewgoalController extends GetxController {
  //text controllers for goal title and description
  final TextEditingController goalTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  //observable for selected goal type
  var selectedIndex = 0.obs;


  //asign to children dropdown 
  final List<String> assignTo = [
    'Child 1',
    'Child 2',
    'Child 3',
    'Child 4',
  ];
  //observable for selected child
  var selectedChild = 'Child 1'.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}