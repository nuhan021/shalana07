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
            "assets/avatar/hair/yellow_hair.png",
            "assets/avatar/hair/Blue-hair.png",
            "assets/avatar/hair/Green-hair.png",
            "assets/avatar/hair/Light-yellow-color-hair.png",
          ],
        ),

        HairStyle(
          styleName: "purl",
          colors: [
            "assets/avatar/hair/Light-yellow-color-hair.png",
            "assets/avatar/hair/Green-hair.png",
            "assets/avatar/hair/Blue-hair.png",
            "assets/avatar/hair/yellow_hair.png",

          ],
        ),
      ],
    ),
  );


  // ----------------------------- Change hair style and color ---------------------------

  // currently selected hair style
  var selectedStyleIndex = 0.obs;
  // currently selected hair color
  var selectedColorIndex = 0.obs;

  // change hair style
  void changeHairStyle(int index) {
    selectedStyleIndex.value = index;
    selectedColorIndex.value = 0;
  }

  // change selected hair color
  void changeSelectedHairColor(int index) {
    selectedColorIndex.value = index;
  }

  // get current hair style
  String get currentHairStyle {
    return totalElements
        .hair
        .elements[selectedStyleIndex.value]
        .colors[selectedColorIndex.value];
  }


// ----------------------------- End Change hair style and color ---------------------------
}

// this class is for total element of the avatar
class TotalElements {
  TotalElements({required this.hair});
  final StyleElement hair;
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
