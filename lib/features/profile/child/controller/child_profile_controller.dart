import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/profile/model/child_model.dart';

import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/constants/api_constants.dart';
import '../../../auth/model/child_login_model.dart';

class ChildProfileController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    AppLoggerHelper.debug(childModel.toString());
  }

   Future<void> getUserData() async {
     isChildProfileLoading.value = true;

     final token = StorageService.token;

     var response = await _networkCaller.getRequest(
       "${Api.baseUrl}/auth/get-profile",
       token: token,
     );

     if(response.statusCode == 401) {
       final tokenService = Get.find<TokenService>();
       if(await tokenService.refreshToken()) {
         response = await _networkCaller.getRequest(
           "${Api.baseUrl}/auth/get-profile",
           token: token,
         );
       }

     }

     isChildProfileLoading.value = false;

     if (!response.isSuccess) {
       Get.snackbar("Error", response.errorMessage);
       isChildProfileError.value = true;
       return;
     }

     if (response.responseData['data']['role'] == 'CHILD') {
       final model = ChildModel.fromJson(response.responseData);
       childModel.value = model;
     }
     isChildProfileError.value = false;
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

   var selectedImagePath = ''.obs;
   var toggle = false.obs;
   RxBool isChildProfileLoading = false.obs;
   RxBool isChildProfileError = false.obs;

  Rx<ChildModel?> childModel = Rx<ChildModel?>(null);
}