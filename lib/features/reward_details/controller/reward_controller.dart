import 'package:get/get.dart';
import 'package:shalana07/features/store/model/unlock_assets_model.dart';

import '../../../core/common/service/token_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/utils/constants/api_constants.dart';

class RewardController extends GetxController {
  RxBool isUnlockLoading = false.obs;
  RxBool isUnlockError = false.obs;
  RxBool isUnlocked = false.obs;
  Rx<UnlockAssetModel?> unlockAssetsModel = Rx<UnlockAssetModel?>(null);

  final NetworkCaller _networkCaller = NetworkCaller();

  Future<void> unlockAssets(String id) async {
    isUnlockLoading.value = true;
    isUnlocked.value = false;

    final token = StorageService.token;

    var response = await _networkCaller.postRequest(
      "${Api.baseUrl}/avatar/unlock-asset",
      body: {
        "assetIds": [id]
      },
      token: token,
    );

    if (response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if (await tokenService.refreshToken()) {
        final newToken = StorageService.token;
        response = await _networkCaller.postRequest(
          "${Api.baseUrl}/avatar/unlock-asset",
          body: {
            "assetIds": [id]
          },
          token: newToken,
        );
      }
    }

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      isUnlockError.value = true;
      isUnlockLoading.value = false;
      return;
    }

    unlockAssetsModel.value = UnlockAssetModel.fromJson(response.responseData);

    if(unlockAssetsModel.value!.data.unlockedCount == 1) {
      isUnlocked.value = true;
    }

    isUnlockLoading.value = false;
    isUnlockError.value = false;
  }
}
