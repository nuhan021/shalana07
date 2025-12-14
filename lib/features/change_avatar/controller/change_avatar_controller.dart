import 'package:get/get.dart';
import 'package:shalana07/features/change_avatar/model/finded_avatar_model.dart';

import '../../../core/common/service/token_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/utils/constants/api_constants.dart';

class ChangeAvatarController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  late RxString selectedGender = "".obs;
  late RxString selectedRegion = "".obs;
  RxBool isFindAvatarLoading = false.obs;
  RxBool isFindAvatarError = false.obs;
  Rx<FindedAvatarModel?> findedAvatars = Rx<FindedAvatarModel?>(null);


  Future<void> findAvatars() async {
    isFindAvatarLoading.value = true;
    final token = StorageService.token;

    var response = await _networkCaller.getRequest(
      "${Api.baseUrl}/avatar/available?origin=${selectedRegion.value}&gender=${selectedGender.value}",
      token: token,
    );

    if (response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if (await tokenService.refreshToken()) {
        final newToken = StorageService.token;
        response = await _networkCaller.getRequest(
          "${Api.baseUrl}/avatar/available?origin=${selectedRegion.value}&gender=${selectedGender.value}",
          token: newToken,
        );
      }
    }

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      isFindAvatarLoading.value = true;
      isFindAvatarError.value = true;
      return;
    }

    findedAvatars.value = FindedAvatarModel.fromJson(response.responseData);
    isFindAvatarLoading.value = false;
    isFindAvatarError.value = false;
  }
}
