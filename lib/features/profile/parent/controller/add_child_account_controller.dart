import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/logging/logger.dart';

import '../../../../core/common/service/token_service.dart';

class AddChildAccountController extends GetxController {
  RxBool isCreateChildAccountLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController relationShipController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Holds the single picked image
  final Rxn<XFile> image = Rxn<XFile>();
  var selectedAccountType = "".obs;
  var selectedLocation = "".obs;
  var selectGender = "".obs;
  var date = DateTime(2025).obs;
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

  var accountTypes = ["ADMIN", "MODERATOR", "VIEWER"].obs;

  var locations = ["New York", "London", "Dhaka", "Tokyo"].obs;

  var gender = ["MALE", "FEMALE"].obs;

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

  bool _validateInputs() {
    if (image.value == null) {
      Get.snackbar("Missing Image", "Please select a profile photo.");
      return false;
    }

    if (nameController.text.trim().isEmpty) {
      Get.snackbar("Missing Name", "Child name is required.");
      return false;
    }

    if (emailController.text.trim().isEmpty) {
      Get.snackbar("Missing Email", "Email cannot be empty.");
      return false;
    }

    if (passwordController.text.trim().isEmpty) {
      Get.snackbar("Missing Password", "Password is required.");
      return false;
    }

    if (selectGender.value.isEmpty) {
      Get.snackbar("Missing Gender", "Please select a gender.");
      return false;
    }

    if (phoneNumberController.text.trim().isEmpty) {
      Get.snackbar("Missing Phone Number", "Phone number is required.");
      return false;
    }

    if (relationShipController.text.trim().isEmpty) {
      Get.snackbar("Missing Relationship", "Relationship field is required.");
      return false;
    }

    if (date.value == null) {
      Get.snackbar("Missing Date of Birth", "Please pick a date of birth.");
      return false;
    }

    if (selectedLocation.value.isEmpty) {
      Get.snackbar("Missing Location", "Please select a location.");
      return false;
    }

    if (selectedAccountType.value.isEmpty) {
      Get.snackbar("Missing Account Type", "Select an account type.");
      return false;
    }

    return true;
  }

  Future<void> createChildAccount() async {
    // VALIDATION — do not continue if anything is missing
    if (!_validateInputs()) return;

    isCreateChildAccountLoading.value = true;

    final childData = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "name": nameController.text.trim(),
      "gender": selectGender.value,
      "phone": phoneNumberController.text.trim(),
      "relation": relationShipController.text.trim(),
      "dateOfBirth": date.value.toUtc().toIso8601String(),
      "location": selectedLocation.value,
      "accountType": selectedAccountType.value,
      "editProfile": editProfile.value,
      "createGoals": createGoal.value,
      "approveTasks": taskApprovals.value,
      "deleteGoals": deleteGoals.value,
      "deleteAccount": deleteAccount.value,
    };

    final uri = Uri.parse("${Api.baseUrl}/auth/create-child");

    final request = http.MultipartRequest("POST", uri);

    // Add text field (the big JSON)
    request.fields['data'] = jsonEncode(childData);

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        image.value!.path,
        filename: image.value!.path.split('/').last,
      ),
    );

    request.headers['Authorization'] = StorageService.token!;
    request.headers['Content-Type'] = "multipart/form-data";

    final response = await request.send();
    final resBody = await response.stream.bytesToString();

    if(response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if(await tokenService.refreshToken()) {
        final response = await request.send();
        final resBody = await response.stream.bytesToString();
      }

    }

    isCreateChildAccountLoading.value == false;

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Success message
      Get.snackbar(
        "Success",
        "Child account created successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      // Error message
      Get.snackbar(
        "Error",
        "Failed to create child account. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
