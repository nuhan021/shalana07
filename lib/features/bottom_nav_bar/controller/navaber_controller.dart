import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavaberController extends  GetxController{
final PersistentTabController controller = PersistentTabController(initialIndex: 0);

//change screen
void jumpToScreen(int index) {
  controller.jumpToTab(index);
}

}