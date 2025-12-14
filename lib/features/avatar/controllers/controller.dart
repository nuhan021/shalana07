import 'package:get/get.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/avatar/model/current_avatar.dart';

import '../../../core/common/service/token_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../../../core/utils/constants/image_path.dart';

class AvatarScreenController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  @override
  void onInit() {
    super.onInit();
    getCurrentAvatar();
  }

  Future<void> getCurrentAvatar() async {
    isCurrentAvatarIsLoading.value = true;
    final token = StorageService.token;

    var response = await _networkCaller.getRequest(
      "${Api.baseUrl}/avatar/owned",
      token: token,
    );

    if (response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if (await tokenService.refreshToken()) {
        final newToken = StorageService.token;
        response = await _networkCaller.getRequest(
          "${Api.baseUrl}/avatar/owned",
          token: newToken,
        );
      }
    }

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      isCurrentAvatarIsError.value = true;
      isCurrentAvatarIsLoading.value = false;
      return;
    }

    final responseData = response.responseData;
    currentAvatar.value = CurrentAvatar.fromJson(responseData);

    isCurrentAvatarIsLoading.value = false;
    isCurrentAvatarIsError.value = false;
  }


  RxBool isCurrentAvatarIsLoading = false.obs;
  RxBool isCurrentAvatarIsError = false.obs;

  final Rx<CurrentAvatar?> currentAvatar = Rx<CurrentAvatar?>(null);

  final List<TrendingItem> trendingItems = [
    TrendingItem(
      imgUrl: ImagePath.cat,
      title: 'Cat-yellow and white',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.ambarDress,
      title: 'Amber Dress',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.yellowDress,
      title: 'Yellow Dress',
      coin: "120",
    ),
    TrendingItem(
      imgUrl: ImagePath.ambarDress,
      title: 'Ambar Dress',
      coin: "120",
    ),
  ];

  final List<TrendingItem> dress = [
    TrendingItem(
      imgUrl: ImagePath.yellowDress,
      title: 'Yellow Dress',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.ambarDress,
      title: 'Green Dress',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.lightBlueDress,
      title: 'Blue Dress',
      coin: "120",
    ),
  ];

  final List<TrendingItem> pets = [
    TrendingItem(
      imgUrl: ImagePath.cat2,
      title: 'German Dog',
      coin: "150"
    ),
    TrendingItem(
      imgUrl: ImagePath.cat3,
      title: 'Indian Cat',
      coin: "150"
    ),
    TrendingItem(
      imgUrl: ImagePath.cat4,
      title: 'UK Cat',
      coin: "150"
    ),
    TrendingItem(
      imgUrl: ImagePath.cat5,
      title: 'US Cat',
      coin: "150"
    ),

  ];

  final List<TrendingItem> hair = [
    TrendingItem(
      imgUrl: ImagePath.redLonghair,
      title: 'Long Hair',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.longHair,
      title: 'Red Long Hair',
      coin: "150",
    ),
  ];

  final List<TrendingItem> avatar = [
    TrendingItem(
      imgUrl: ImagePath.grilavater_1,
      title: 'Long Hair',
      coin: "150",
    ),

    TrendingItem(
      imgUrl: ImagePath.girlAvater_2,
      title: 'Red Long Hair',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.girlAvater_3,
      title: 'Red Long Hair',
      coin: "150",
    ),TrendingItem(
      imgUrl: ImagePath.girlavater_4,
      title: 'Red Long Hair',
      coin: "150",
    ),TrendingItem(
      imgUrl: ImagePath.girlAvatar_5,
      title: 'Red Long Hair',
      coin: "150",
    ),TrendingItem(
      imgUrl: ImagePath.girlAvatar_7,
      title: 'Red Long Hair',
      coin: "150",
    ),
  ];
}

class TrendingItem {
  TrendingItem({required this.imgUrl, required this.title, required this.coin});

  final String imgUrl;
  final String title;
  final String coin;
}
