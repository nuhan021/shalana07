// child_edit_profile_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/features/profile/model/child_model.dart';

class ChildEditProfileController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();
  final RxBool isLoading = false.obs;

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController locationController;
  late TextEditingController relationController;
  late TextEditingController dateOfBirthController;

  String? childId;

  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
  ];

  var selectedCity = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    locationController = TextEditingController();
    relationController = TextEditingController();
    dateOfBirthController = TextEditingController();
  }

  Future<void> loadChildData(ChildModel model) async {
    final profile = model.data.childProfile;
    childId = profile.id;

    nameController.text = profile.name;
    phoneController.text = profile.phone;
    emailController.text = profile.email;
    relationController.text = profile.relation;
    dateOfBirthController.text = profile.dateOfBirth.toIso8601String();

    final String apiLocation = profile.location;

    
    if (cities.contains(apiLocation)) {
      selectedCity.value = apiLocation;
    } else {
      selectedCity.value = '';
    }

    locationController.text = apiLocation;

    update();
  }

  Future<void> saveProfile() async {
    if (childId == null) {
      Get.snackbar('Error', 'Child ID not found.');
      return;
    }

    isLoading.value = true;

    final body = {
      "name": nameController.text.trim(),
      "gender": "FEMALE", 
      "phone": phoneController.text.trim(),
      "relation": relationController.text.trim(),
      "dateOfBirth": dateOfBirthController.text.trim(),
      "location": locationController.text.trim(),
      "accountType": "MODERATOR",
    };

    final token = StorageService.token;
    final response = await _networkCaller.patchRequest(
      '${Api.baseUrl}/auth/update-child/$childId',
      body: body,
      token: token,
    );

    isLoading.value = false;

    if (response.isSuccess) {
      Get.snackbar('Success', 'Profile updated successfully.');
      Get.back();
    } else {
      Get.snackbar('Error', response.errorMessage);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    locationController.dispose();
    relationController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }
}