import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/profile/model/parent_helper.dart';

class ParentProfileController extends GetxController {
  var pushNotifications = true.obs;
  var dailyReminders = true.obs;
  var childTaskUpdates = true.obs;
  var selectedImagePath = ''.obs;

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image selected");
    }
  }






  // Future<void> pickImageFromCamera() async {
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

  //   if (pickedFile != null) {
  //     selectedImagePath.value = pickedFile.path;
  //   } else {
  //     Get.snackbar("Error", "No image captured");
  //   }
  // }

  final List<ParentHelper> messages = [
    ParentHelper(
      avatar: ImagePath.childAvatar,
      challengeName: "Reading Challenge",
      childName: "Calista Kimimela",
      message:
          "Hi Mom 😊, I’m working on my Reading challenge, but I need a little help to finish it....",
      time: "Today · 10:30 AM",
      isRead: false,
    ),
    ParentHelper(
      avatar: ImagePath.childAvatar,
      challengeName:
          "Calista Kimimela Completed “Writing Challenge” Earned 10 Coins",
      childName: "Calista Kimimela",
      message: "",
      time: "Yesterday · 03:45 PM",
      isRead: false,
    ),
    ParentHelper(
      avatar: ImagePath.childAvatar,
      challengeName: "Science Challenge",
      childName: "Emma Williams",
      message: "Mom, I am stuck on the Science challenge, can you help me?",
      time: "Yesterday · 09:20 AM",
      isRead: true,
    ),
  ];
}
