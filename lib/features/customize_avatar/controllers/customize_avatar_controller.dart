import 'package:get/get.dart';

class CustomizeAvatarController extends GetxController {

  RxString selectedAvatarObject = 'Hair'.obs;

  RxInt selectedTab = 0.obs;

  void toggleIsAvatarTab(int index) {
    selectedTab.value = index;
  }

  var totalElements = TotalElements(
    hair: StyleElement(
      name: 'Hair',
      elements: [
        HairStyle(
          styleName: "curly",
          colors: [
            "assets/avatar/hair/style_1/yellow_hair.png",
            "assets/avatar/hair/style_1/Blue-hair.png",
            "assets/avatar/hair/style_1/Green-hair.png",
            "assets/avatar/hair/style_1/Light-yellow-color-hair.png",
          ],
        ),

        HairStyle(styleName: 'Normal', colors: [
          "assets/avatar/hair/style_2/brown-hair.png",
        ]),

        HairStyle(styleName: 'Long', colors: [
          "assets/avatar/hair/style_3/black-hair.png",
          "assets/avatar/hair/style_3/green-hair.png",
          "assets/avatar/hair/style_3/marun-hair.png",
        ]),
      ],
    ),

    dress: StyleElement(
      name: 'Dress',
      elements: [
        DressStyle(
          styleName: 'Basic',
          colors: [
            "assets/avatar/dress/dress_1/basic.png"
          ]
        ),

        DressStyle(
            styleName: 'Neckless',
            colors: [
              "assets/avatar/dress/dress_2/neckless_bright.png",
              "assets/avatar/dress/dress_2/neckless_red.png",
            ]
        ),

        DressStyle(
            styleName: 'Tops',
            colors: [
              "assets/avatar/dress/dress_3/tops_deep_purple.png",
              "assets/avatar/dress/dress_3/tops_green.png",
            ]
        ),
      ]
    )

  );


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
        .dress
        .elements[selectedDressStyleIndex.value]
        .colors[selectedDressColorIndex.value];
  }


// ----------------------------- End Change dress style and color ---------------------------


}

// this class is for total element of the avatar
class TotalElements {
  TotalElements({required this.hair, required this.dress});
  final StyleElement hair;
  final StyleElement dress;
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
