import 'package:get/get.dart';
import 'package:shalana07/core/services/storage_service.dart';

class CustomizeAvatarController extends GetxController {
  RxString selectedAvatarObject = 'Hair'.obs;
  RxString selectedAccessories = 'Jewelry'.obs;
  RxInt selectedTab = 0.obs;

  final currentAvatarIndex = int.parse(
    StorageService.getCurrentAvatar.toString(),
  );

  void toggleIsAvatarTab(int index) {
    selectedTab.value = index;
  }

  TotalElements avatar1 = TotalElements(
    avatarImgUrl: "assets/avatar/avatar1/skeleton/2.png",
    hair: StyleElement(
      name: 'Hair',
      elements: [
        HairStyle(
          styleName: 'Long',
          colors: [
            "assets/avatar/avatar1/hair/style_3/6.png",
            "assets/avatar/avatar1/hair/style_3/7.png",
            "assets/avatar/avatar1/hair/style_3/8.png",
          ],
        ),
        HairStyle(
          styleName: "curly",
          colors: [
            "assets/avatar/avatar1/hair/style_1/9.png",
            "assets/avatar/avatar1/hair/style_1/10.png",
          ],
        ),

        HairStyle(
          styleName: 'Normal',
          colors: [
            "assets/avatar/avatar1/hair/style_2/4.png",
            "assets/avatar/avatar1/hair/style_2/5.png",
          ],
        ),
      ],
    ),

    dress: StyleElement(
      name: 'Dress',
      elements: [
        DressStyle(
          styleName: 'Neckless',
          colors: [
            "assets/avatar/avatar1/dress/dress_2/16.png",
            "assets/avatar/avatar1/dress/dress_2/17.png",
          ],
        ),


        DressStyle(
          styleName: 'Basic',
          colors: ["assets/avatar/avatar1/dress/dress_1/15.png"],
        ),



        DressStyle(
          styleName: 'Tops',
          colors: [
            "assets/avatar/avatar1/dress/dress_3/12.png",
            "assets/avatar/avatar1/dress/dress_3/13.png",
            "assets/avatar/avatar1/dress/dress_3/14.png",
          ],
        ),
      ],
    ),

    jewelry: StyleElement(
      name: 'Jewelry',
      elements: [
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar1/jewelry/3.png"],
        ),
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar1/jewelry/1.png"],
        ),
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar1/jewelry/2.png"],
        ),

      ],
    ),
  );

  TotalElements avatar2 = TotalElements(
    avatarImgUrl: "assets/avatar/avatar2/skeleton/avatar.png",
    hair: StyleElement(
      name: 'Hair',
      elements: [
        HairStyle(
          styleName: "curly",
          colors: [
            "assets/avatar/avatar2/hair/style_1/30.png",
            "assets/avatar/avatar2/hair/style_1/31.png",
            "assets/avatar/avatar2/hair/style_1/32.png",
          ],
        ),

        HairStyle(
          styleName: 'Normal',
          colors: [
            "assets/avatar/avatar2/hair/style_2/33.png",
            "assets/avatar/avatar2/hair/style_2/34.png",
          ],
        ),
      ],
    ),

    dress: StyleElement(
      name: 'Dress',
      elements: [
        DressStyle(
          styleName: 'Basic',
          colors: [
            "assets/avatar/avatar2/dress/dress_1/35.png",
            "assets/avatar/avatar2/dress/dress_1/48.png",
          ],
        ),

        DressStyle(
          styleName: 'Neckless',
          colors: [
            "assets/avatar/avatar2/dress/dress_2/36.png",
            "assets/avatar/avatar2/dress/dress_2/49.png",
          ],
        ),
      ],
    ),

    jewelry: StyleElement(
      name: 'Jewelry',
      elements: [
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar2/jewelry/50.png"],
        ),
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar2/jewelry/51.png"],
        ),
      ],
    ),
  );

  TotalElements avatar3 = TotalElements(
    avatarImgUrl: "assets/avatar/avatar3/skeleton/avatar.png",
    hair: StyleElement(
      name: 'Hair',
      elements: [
        HairStyle(
          styleName: "curly",
          colors: [
            "assets/avatar/avatar3/hair/style_1/37.png",
            "assets/avatar/avatar3/hair/style_1/38.png",
          ],
        ),

        HairStyle(
          styleName: 'Normal',
          colors: [
            "assets/avatar/avatar3/hair/style_2/43.png",
            "assets/avatar/avatar3/hair/style_2/44.png",
          ],
        ),
      ],
    ),

    dress: StyleElement(
      name: 'Dress',
      elements: [
        DressStyle(
          styleName: 'Basic',
          colors: [
            "assets/avatar/avatar3/dress/dress_1/39.png",
            "assets/avatar/avatar3/dress/dress_1/40.png",
          ],
        ),

        DressStyle(
          styleName: 'Neckless',
          colors: [
            "assets/avatar/avatar3/dress/dress_2/41.png",
            "assets/avatar/avatar3/dress/dress_2/42.png",
          ],
        ),
      ],
    ),

    jewelry: StyleElement(
      name: 'Jewelry',
      elements: [
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar3/jewelry/46.png"],
        ),
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar3/jewelry/47.png"],
        ),
      ],
    ),
  );

  TotalElements avatar4 = TotalElements(
    avatarImgUrl: "assets/avatar/avatar4/skeleton/3.png",
    hair: StyleElement(
      name: 'Hair',
      elements: [
        HairStyle(
          styleName: "curly",
          colors: [
            "assets/avatar/avatar4/hair/style_1/4.png",
            "assets/avatar/avatar4/hair/style_1/5.png",
          ],
        ),

        HairStyle(
          styleName: 'Normal',
          colors: [
            "assets/avatar/avatar4/hair/style_2/12.png",
            "assets/avatar/avatar4/hair/style_2/13.png",
          ],
        ),
      ],
    ),

    dress: StyleElement(
      name: 'Dress',
      elements: [
        DressStyle(
          styleName: 'Basic',
          colors: [
            "assets/avatar/avatar4/dress/dress_1/14.png",
            "assets/avatar/avatar4/dress/dress_1/15.png",
          ],
        ),

        DressStyle(
          styleName: 'Neckless',
          colors: [
            "assets/avatar/avatar4/dress/dress_2/6.png",
            "assets/avatar/avatar4/dress/dress_2/7.png",
          ],
        ),
      ],
    ),

    jewelry: StyleElement(
      name: 'Jewelry',
      elements: [
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar4/jewelry/8.png"],
        ),
        JewelryStyle(
          styleName: 'Style 1',
          colors: ["assets/avatar/avatar4/jewelry/11.png"],
        ),
      ],
    ),
  );

  late List<TotalElements> avatars = [avatar1, avatar2, avatar3, avatar4];

  late var totalElements = avatars[currentAvatarIndex].obs;

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
    return totalElements
        .value
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
    return totalElements
        .value
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
    return totalElements
        .value
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
class TotalElements {
  TotalElements({
    required this.avatarImgUrl,
    required this.hair,
    required this.dress,
    required this.jewelry,
  });
  final String avatarImgUrl;
  final StyleElement hair;
  final StyleElement dress;
  final StyleElement jewelry;
}

//
class StyleElement {
  StyleElement({required this.name, required this.elements});
  final String name;
  final List<dynamic> elements;
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
