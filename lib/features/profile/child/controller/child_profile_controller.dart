// child_profile_controller.dart
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/home/child/model/child_goal_model.dart';
import 'package:shalana07/features/profile/model/child_model.dart';
import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/constants/api_constants.dart';

class ChildProfileController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  final Rx<ChildModel?> childModel = Rx<ChildModel?>(null);
  final Rx<ChildGoalsModel?> childGoalModel = Rx<ChildGoalsModel?>(null);
  final RxBool isChildProfileLoading = false.obs;
  final RxBool isChildProfileError = false.obs;
  final RxBool toggle = false.obs;
  final RxString selectedImagePath = ''.obs;
  
  // Goal statistics
  final RxInt completedTasks = 0.obs;
  final RxInt activeTasks = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    await loadChildGoals();
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

  // Load child goals and calculate statistics
  Future<void> loadChildGoals() async {
    final token = StorageService.token;
    
    final response = await _networkCaller.getRequest(
      "${Api.baseUrl}/goals/child-goals",
      token: token,
    );
    
    if (response.isSuccess) {
      try {
        final model = ChildGoalsModel.fromJson(response.responseData);
        childGoalModel.value = model;
        
        // Calculate completed and active tasks
        if (model.data != null && model.data.isNotEmpty) {
          int completed = 0;
          int active = 0;
          
          for (var goal in model.data) {
            if (goal.goal.status == 'COMPLETED') {
              completed++;
            } else if (goal.goal.status == 'ACTIVE') {
              active++;
            }
          }
          
          completedTasks.value = completed;
          activeTasks.value = active;
        }
      } catch (e) {
        AppLoggerHelper.debug('Error parsing goals: $e');
      }
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
