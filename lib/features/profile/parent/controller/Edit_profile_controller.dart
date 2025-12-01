import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/profile/parent/controller/parent_profile_controller.dart';

import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/storage_service.dart';

class EditProfileController extends GetxController {

  @override
  void onInit() {

    super.onInit();
    final ParentProfileController controller = Get.find<ParentProfileController>();

    id = controller.parentModel.value?.data.parentProfile.id;
    
    final parent = controller.parentModel.value?.data.parentProfile;
    nameController.text = parent?.name ?? '';
    phoneNumberController.text = parent?.phone ?? '';
    emailController.text = controller.parentModel.value?.data.email ?? '';
    selectedCity.value = parent?.location ?? '';
  }

    // The selected city
  var selectedCity = ''.obs;
  
  RxBool isUpdateLoading = false.obs;

  String? id;



  // List of cities
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController parentController = TextEditingController();

  var selectedImagePath = ''.obs;
  final Rxn<XFile> image = Rxn<XFile>();

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      image.value = pickedFile;
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image selected");
    }
  }



  Future<void> updateProfile() async {
    isUpdateLoading.value = true;
    
    final updateData = {
      'name': nameController.text.trim(),
      'phone': phoneNumberController.text.trim(),
      'email': emailController.text.trim(),
      if(passwordController.text.trim().isNotEmpty) 'password': passwordController.text.trim(),
      'location': selectedCity.value,
    };

    final uri = Uri.parse("${Api.baseUrl}/auth/update-parent/$id");

    final request = http.MultipartRequest("PATCH", uri);

    request.fields['data'] = jsonEncode(updateData);

    if (image.value != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          image.value!.path,
          filename: image.value!.path.split('/').last,
        ),
      );
    }

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

    isUpdateLoading.value = false;

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Success message
      Get.snackbar(
        "Success",
        "Update Successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      // Error message
      AppLoggerHelper.debug(id.toString());
      Get.snackbar(
        "Error",
        "Failed to update profile. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
   
  }
}