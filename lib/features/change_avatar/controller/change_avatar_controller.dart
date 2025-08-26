import 'package:get/get.dart';

class ChangeAvatarController extends GetxController {
  RxList genders = ['Apple', 'Banana', 'Cherry', 'Durian'].obs;
  late RxString selectedGender = genders.first.obs;
}
