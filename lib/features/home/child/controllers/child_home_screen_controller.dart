import 'package:get/get.dart';

class ChildHomeScreenController extends GetxController {

  RxInt selectedTab = 0.obs;

  void toggleIsAvatarTab(int index) {
    selectedTab.value = index;
  }
}