import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateNewgoalController extends GetxController {
  final TextEditingController goalTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}