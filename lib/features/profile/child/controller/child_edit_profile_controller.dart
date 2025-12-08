import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/features/profile/model/child_model.dart';
import 'package:shalana07/features/profile/child/controller/child_profile_controller.dart';

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
  
  // Dynamic gender selection
  var selectedGender = 'MALE'.obs;
  var selectedAccountType = 'MODERATOR'.obs;

  final List<String> genderOptions = ['MALE', 'FEMALE', 'OTHER'];
  final List<String> accountTypeOptions = ['MODERATOR', 'USER'];

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
    try {

      final profile = model.data.childProfile;
      childId = profile.id;

      nameController.text = profile.name;
      phoneController.text = profile.phone;
      emailController.text = profile.email;
      relationController.text = profile.relation;
      dateOfBirthController.text = profile.dateOfBirth.toIso8601String();

      // Load gender and account type dynamically
      if (profile.gender != null && genderOptions.contains(profile.gender)) {
        selectedGender.value = profile.gender;
      }
      
      if (profile.accountType != null && accountTypeOptions.contains(profile.accountType)) {
        selectedAccountType.value = profile.accountType;
      }

      final String apiLocation = profile.location;

      
      if (cities.contains(apiLocation)) {
        selectedCity.value = apiLocation;
      } else {
        selectedCity.value = '';
      }

      locationController.text = apiLocation;

      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load child data: ${e.toString()}');
    }
  }

  Future<void> saveProfile() async {
    if (childId == null) {
      Get.snackbar('Error', 'Child ID not found.');
      return;
    }

    // Validate required fields
    if (nameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Name is required.');
      return;
    }

    if (phoneController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Phone number is required.');
      return;
    }

    if (relationController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Relation is required.');
      return;
    }

    isLoading.value = true;

    final profileData = {
      "name": nameController.text.trim(),
      "gender": selectedGender.value,
      "phone": phoneController.text.trim(),
      "relation": relationController.text.trim(),
      "dateOfBirth": dateOfBirthController.text.trim(),
      "location": locationController.text.trim(),
      "accountType": selectedAccountType.value,
    };

    // Send data as JSON string in 'data' field
    final body = {
      "data": jsonEncode(profileData),
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
      
      // Refresh profile data in real-time
      try {
        if (Get.isRegistered<ChildProfileController>()) {
          final profileController = Get.find<ChildProfileController>();
          await profileController.getUserData();
        }
      } catch (e) {
        // Profile controller not found, continue
      }
      
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