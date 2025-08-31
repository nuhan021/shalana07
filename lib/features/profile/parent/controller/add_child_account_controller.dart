import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddChildAccountController extends GetxController{
   final ImagePicker _picker = ImagePicker();

  /// Holds the single picked image
  final Rxn<XFile> image = Rxn<XFile>();
    var selectedAccountType = "".obs;
    var selectedLocation = "".obs;

  Future<void> pickFromGallery() async {
    try {
      final picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1920,
      );
      if (picked != null) {
        image.value = picked;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }
   var accountTypes = ["Moderator", "Admin", "User"].obs;


  var locations = ["New York", "London", "Dhaka", "Tokyo"].obs;


  /// Full Access toggle
  var fullAccess = false.obs;

  /// Custom group toggle
  var custom = false.obs;

  /// Individual permissions (all custom toggles)
  var addAccount = false.obs;
  var accessOtherAccount = false.obs;
  var editProfile = false.obs;
  var createGoal = false.obs;
  var taskApprovals = true.obs;
  var giveFeedback = true.obs;
  var customizeAvatar = true.obs;
  var deleteGoals = true.obs;
  var unlockRewards = true.obs;
  var deleteAccount = true.obs;

  /// Optionally: reset all
  void resetAll() {
    fullAccess.value = false;
    custom.value = false;
    addAccount.value = false;
    accessOtherAccount.value = false;
    editProfile.value = false;
    createGoal.value = false;
    taskApprovals.value = false;
    giveFeedback.value = false;
    customizeAvatar.value = false;
    deleteGoals.value = false;
    unlockRewards.value = false;
    deleteAccount.value = false;
  }


   void setFullAccess(bool value) {
    fullAccess.value = value;
    if (value) {
      custom.value = false; // turn off custom if full access is on
    }
  }

  void setCustom(bool value) {
    custom.value = value;
    if (value) {
      fullAccess.value = false; // turn off full access if custom is on
    }
  }
  
}