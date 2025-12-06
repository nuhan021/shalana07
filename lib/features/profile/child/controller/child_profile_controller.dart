// child_profile_controller.dart
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/profile/model/child_model.dart';
import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/constants/api_constants.dart';

class ChildProfileController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  final Rx<ChildModel?> childModel = Rx<ChildModel?>(null);
  final RxBool isChildProfileLoading = false.obs;
  final RxBool isChildProfileError = false.obs;
  final RxBool toggle = false.obs; 
  final RxString selectedImagePath = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    AppLoggerHelper.debug(childModel.toString());
  }

  Future<void> getUserData() async {
    isChildProfileLoading.value = true;
    isChildProfileError.value = false;

    final token = StorageService.token;

    var response = await _networkCaller.getRequest(
      "${Api.baseUrl}/auth/get-profile",
      token: token,
    );

    
    if (response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if (await tokenService.refreshToken()) {
        
        final newToken = StorageService.token;
        response = await _networkCaller.getRequest(
          "${Api.baseUrl}/auth/get-profile",
          token: newToken,
        );
      }
    }

    isChildProfileLoading.value = false;

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      isChildProfileError.value = true;
      return;
    }

    // Parse response based on role
    final responseData = response.responseData;
    if (responseData['data']['role'] == 'CHILD') {
      final model = ChildModel.fromJson(responseData);
      childModel.value = model;

      
      toggle.value = model.data.childProfile.parent.pushNotification;
    } else {
      Get.snackbar("Error", "Expected child profile, got different role.");
      isChildProfileError.value = true;
    }
  }

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