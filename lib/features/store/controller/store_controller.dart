import 'package:get/get.dart';
import 'package:shalana07/core/utils/constants/enums.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/store/model/store_model.dart';

import '../../../core/common/service/token_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/utils/constants/api_constants.dart';

class StoreController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  Rx<StoreModel?> trendingItems = Rx<StoreModel?>(null);
  Rx<StoreModel?> dressItems = Rx<StoreModel?>(null);
  Rx<StoreModel?> hairItems = Rx<StoreModel?>(null);
  Rx<StoreModel?> avatarItems = Rx<StoreModel?>(null);

  RxBool trendingItemsLoading = false.obs;
  RxBool dressItemsLoading = false.obs;
  RxBool hairItemsLoading = false.obs;
  RxBool avatarItemsLoading = false.obs;

  RxBool trendingItemsError = false.obs;
  RxBool dressItemsError = false.obs;
  RxBool hairItemsError = false.obs;
  RxBool avatarItemsError = false.obs;

  void findErrorItem({required StoreItems itemName, required bool value}) {
    switch (itemName) {
      case StoreItems.trending:
        trendingItemsError.value = value;
        break;
      case StoreItems.dress:
        dressItemsError.value = value;
        break;
      case StoreItems.hair:
        hairItemsError.value = value;
        break;
      case StoreItems.avatar:
        avatarItemsError.value = value;
        break;
    }
  }

  void findLoadingItem({required StoreItems itemName, required bool value}) {
    switch (itemName) {
      case StoreItems.trending:
        trendingItemsLoading.value = value;
        break;
      case StoreItems.dress:
        dressItemsLoading.value = value;
        break;
      case StoreItems.hair:
        hairItemsLoading.value = value;
        break;
      case StoreItems.avatar:
        avatarItemsLoading.value = value;
        break;
    }
  }

  void setData({required StoreItems itemName, required StoreModel data}) {
    switch (itemName) {
      case StoreItems.trending:
        trendingItems.value = data;
        break;
      case StoreItems.dress:
        dressItems.value = data;
        break;
      case StoreItems.hair:
        hairItems.value = data;
        break;
      case StoreItems.avatar:
        avatarItems.value = data;
        break;
    }
  }

  Future<void> getStoreItems({required StoreItems itemName}) async {
    findLoadingItem(itemName: itemName, value: true);
    
    final String item = itemName.toString().split('.').last;
    
    final token = StorageService.token;

    var response = await _networkCaller.getRequest(
      "${Api.baseUrl}/avatar/assets/category/$item",
      token: token,
    );

    if (response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if (await tokenService.refreshToken()) {
        final newToken = StorageService.token;
        response = await _networkCaller.getRequest(
          "${Api.baseUrl}/avatar/assets/category/$item",
          token: newToken,
        );
      }
    }


    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      findErrorItem(itemName: itemName, value: true);
      findLoadingItem(itemName: itemName, value: false);
      return;
    }

    final responseData = response.responseData;
    setData(itemName: itemName, data: StoreModel.fromJson(responseData));

    findErrorItem(itemName: itemName, value: false);
    findLoadingItem(itemName: itemName, value: false);
  }
}
