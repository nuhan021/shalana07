import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/features/customize_avatar/model/customize_avatar_model.dart';

import '../../../core/common/service/token_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/api_constants.dart';

class CustomizeAvatarController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();
  RxString selectedAvatarObject = 'Hair'.obs;
  RxString selectedAccessories = 'Jewelry'.obs;
  RxInt selectedTab = 0.obs;
  RxBool isChangeAvatarLoading = false.obs;
  RxBool isChangeAvatarError = false.obs;
  // Dynamic avatars list
  RxList<TotalElements> avatars = <TotalElements>[].obs;

  // Current avatar observable
  late Rx<TotalElements?> totalElements = Rx<TotalElements?>(null);
  Rx<CustomizeAvatarModel?> customizeAvatarModel = Rx<CustomizeAvatarModel?>(
    null,
  );

  final currentAvatarIndex = int.parse(
    StorageService.getCurrentAvatar.toString(),
  );

  Future<void> getAvatarCredential({required String id}) async {
    isChangeAvatarLoading.value = true;

    final token = StorageService.token;

    var response = await _networkCaller.getRequest(
      "${Api.baseUrl}/avatar/customization/$id",
      token: token,
    );

    if (response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if (await tokenService.refreshToken()) {
        final newToken = StorageService.token;
        response = await _networkCaller.getRequest(
          "${Api.baseUrl}/avatar/customization/$id",
          token: newToken,
        );
      }
    }

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      isChangeAvatarError.value = true;
      return;
    }

    customizeAvatarModel.value = CustomizeAvatarModel.fromJson(
      response.responseData,
    );
    // Convert API response to TotalElements and add to avatars list
    _convertAndStoreAvatar();
    isChangeAvatarLoading.value = false;
    isChangeAvatarError.value = false;
  }

  void _convertAndStoreAvatar() {
    final data = customizeAvatarModel.value?.data;
    if (data == null) return;

    final convertedAvatar = TotalElements(
      avatarImgUrl: data.avatarImgUrl,
      hair: _convertToStyleElement(data.hair),
      dress: _convertToStyleElement(data.dress),
      jewelry: _convertToStyleElement(data.jewelry),
      eyes: _convertToStyleElement(data.eyes),
      skin: _convertToStyleElement(data.skin),
      nose: _convertToStyleElement(data.nose),
      shoes: _convertToStyleElement(data.shoes),
      accessory: _convertToStyleElement(data.accessory),
      pet: _convertToStyleElement(data.pet),
    );

    // Add to avatars list (or update if exists)
    final existingIndex = avatars.indexWhere(
      (avatar) => avatar.avatarImgUrl == data.avatarImgUrl,
    );

    if (existingIndex != -1) {
      avatars[existingIndex] = convertedAvatar;
    } else {
      avatars.add(convertedAvatar);
    }

    // Set as current avatar
    totalElements.value = convertedAvatar;
  }

  StyleElement _convertToStyleElement(dynamic apiElement) {
    if (apiElement == null || apiElement.elements == null) {
      return StyleElement(name: '', elements: []);
    }

    final elements = (apiElement.elements as List).map((element) {
      final colors = (element.colors as List)
          .map((color) => color.url as String)
          .toList();

      return StyleItem(
        id: element.id,
        styleName: element.styleName,
        colors: colors,
        colorDetails: (element.colors as List)
            .map(
              (color) => ColorDetail(
                id: color.id,
                url: color.url,
                isUnlocked: color.isUnlocked,
                isSelected: color.isSelected,
                price: color.price,
              ),
            )
            .toList(),
      );
    }).toList();

    return StyleElement(name: apiElement.name ?? '', elements: elements);
  }

  void toggleIsAvatarTab(int index) {
    selectedTab.value = index;
  }

  // ----------------------------- Change hair style and color ---------------------------

  // currently selected hair style
  var selectedHairStyleIndex = 0.obs;
  // currently selected hair color
  var selectedHairColorIndex = 0.obs;

  // change hair style
  void changeHairStyle(int index) {
    selectedHairStyleIndex.value = index;
    selectedHairColorIndex.value = 0;
  }

  // change selected hair color
  void changeSelectedHairColor(int index) {
    selectedHairColorIndex.value = index;
  }

  // get current hair style
  String get currentHairStyle {
    if (totalElements.value == null ||
        totalElements.value!.hair.elements.isEmpty) {
      return '';
    }
    return totalElements
        .value!
        .hair
        .elements[selectedHairStyleIndex.value]
        .colors[selectedHairColorIndex.value];
  }

  // ----------------------------- End Change hair style and color ---------------------------

  // ----------------------------- Change dress style and color ---------------------------

  // currently selected hair style
  var selectedDressStyleIndex = 0.obs;
  // currently selected hair color
  var selectedDressColorIndex = 0.obs;

  // change hair style
  void changeDressStyle(int index) {
    selectedDressStyleIndex.value = index;
    selectedDressColorIndex.value = 0;
  }

  // change selected hair color
  void changeSelectedDressColor(int index) {
    selectedDressColorIndex.value = index;
  }

  // get current hair style
  String get currentDressStyle {
    if (totalElements.value == null ||
        totalElements.value!.dress.elements.isEmpty) {
      return '';
    }
    return totalElements
        .value!
        .dress
        .elements[selectedDressStyleIndex.value]
        .colors[selectedDressColorIndex.value];
  }

  // ----------------------------- End Change dress style and color ---------------------------

  // ----------------------------- Change Jewelry style and color ---------------------------

  // currently selected hair style
  var selectedJewelryStyleIndex = 0.obs;
  // currently selected hair color
  var selectedJewelryColorIndex = 0.obs;

  // change hair style
  void changeJewelryStyle(int index) {
    selectedJewelryStyleIndex.value = index;
    selectedJewelryColorIndex.value = 0;
  }

  // change selected hair color
  void changeSelectedJewelryColor(int index) {
    selectedJewelryColorIndex.value = index;
  }

  // get current hair style
  String get currentJewelryStyle {
    if (totalElements.value == null ||
        totalElements.value!.jewelry.elements.isEmpty) {
      return '';
    }
    return totalElements
        .value!
        .jewelry
        .elements[selectedJewelryStyleIndex.value]
        .colors[selectedJewelryColorIndex.value];
  }

  // ----------------------------- End Change Jewelry style and color ---------------------------

  void resetAll() {
    selectedHairStyleIndex.value = 0;
    selectedHairColorIndex.value = 0;

    selectedDressStyleIndex.value = 0;
    selectedDressColorIndex.value = 0;

    selectedJewelryStyleIndex.value = 0;
    selectedJewelryColorIndex.value = 0;
  }
}

// this class is for total element of the avatar
// Updated model classes
class TotalElements {
  TotalElements({
    required this.avatarImgUrl,
    required this.hair,
    required this.dress,
    required this.jewelry,
    this.eyes,
    this.skin,
    this.nose,
    this.shoes,
    this.accessory,
    this.pet,
  });

  final String avatarImgUrl;
  final StyleElement hair;
  final StyleElement dress;
  final StyleElement jewelry;
  final StyleElement? eyes;
  final StyleElement? skin;
  final StyleElement? nose;
  final StyleElement? shoes;
  final StyleElement? accessory;
  final StyleElement? pet;
}

class StyleElement {
  StyleElement({required this.name, required this.elements});
  final String name;
  final List<StyleItem> elements;
}

class StyleItem {
  StyleItem({
    this.id,
    required this.styleName,
    required this.colors,
    this.colorDetails,
  });

  final String? id;
  final String styleName;
  final List<String> colors; // URLs for quick access
  final List<ColorDetail>?
  colorDetails; // Full details including price, unlock status
}

class ColorDetail {
  ColorDetail({
    required this.id,
    required this.url,
    required this.isUnlocked,
    required this.isSelected,
    required this.price,
  });

  final String id;
  final String url;
  final bool isUnlocked;
  final bool isSelected;
  final int price;
}

// this class is for hair style
class HairStyle {
  HairStyle({required this.styleName, required this.colors});

  final String styleName;
  final List<String> colors;
}

// this class is for dress
class DressStyle {
  DressStyle({required this.styleName, required this.colors});
  final String styleName;
  final List<String> colors;
}

// this class is for dress
class JewelryStyle {
  JewelryStyle({required this.styleName, required this.colors});
  final String styleName;
  final List<String> colors;
}
