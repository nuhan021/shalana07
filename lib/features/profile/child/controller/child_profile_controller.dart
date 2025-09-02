import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChildProfileController extends GetxController {
   var selectedImagePath = ''.obs;
   var toggle = false.obs;

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
}