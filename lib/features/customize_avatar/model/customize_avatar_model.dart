// To parse this JSON data, do
//
//     final customizeAvatarModel = customizeAvatarModelFromJson(jsonString);

import 'dart:convert';

CustomizeAvatarModel customizeAvatarModelFromJson(String str) => CustomizeAvatarModel.fromJson(json.decode(str));

String customizeAvatarModelToJson(CustomizeAvatarModel data) => json.encode(data.toJson());

class CustomizeAvatarModel {
  bool success;
  String message;
  Data data;

  CustomizeAvatarModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CustomizeAvatarModel.fromJson(Map<String, dynamic> json) => CustomizeAvatarModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String avatarId;
  String avatarImgUrl;
  String gender;
  String region;
  Accessory hair;
  Accessory dress;
  Accessory jewelry;
  Accessory eyes;
  Accessory skin;
  Accessory nose;
  Accessory shoes;
  Accessory accessory;
  Accessory pet;

  Data({
    required this.avatarId,
    required this.avatarImgUrl,
    required this.gender,
    required this.region,
    required this.hair,
    required this.dress,
    required this.jewelry,
    required this.eyes,
    required this.skin,
    required this.nose,
    required this.shoes,
    required this.accessory,
    required this.pet,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    avatarId: json["avatarId"],
    avatarImgUrl: json["avatarImgUrl"],
    gender: json["gender"],
    region: json["region"],
    hair: Accessory.fromJson(json["hair"]),
    dress: Accessory.fromJson(json["dress"]),
    jewelry: Accessory.fromJson(json["jewelry"]),
    eyes: Accessory.fromJson(json["eyes"]),
    skin: Accessory.fromJson(json["skin"]),
    nose: Accessory.fromJson(json["nose"]),
    shoes: Accessory.fromJson(json["shoes"]),
    accessory: Accessory.fromJson(json["accessory"]),
    pet: Accessory.fromJson(json["pet"]),
  );

  Map<String, dynamic> toJson() => {
    "avatarId": avatarId,
    "avatarImgUrl": avatarImgUrl,
    "gender": gender,
    "region": region,
    "hair": hair.toJson(),
    "dress": dress.toJson(),
    "jewelry": jewelry.toJson(),
    "eyes": eyes.toJson(),
    "skin": skin.toJson(),
    "nose": nose.toJson(),
    "shoes": shoes.toJson(),
    "accessory": accessory.toJson(),
    "pet": pet.toJson(),
  };
}

class Accessory {
  String name;
  List<Element>? elements;

  Accessory({
    required this.name,
    required this.elements,
  });

  factory Accessory.fromJson(Map<String, dynamic> json) => Accessory(
    name: json["name"],
    elements: json["elements"] == null ? [] : List<Element>.from(json["elements"]!.map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "elements": elements == null ? [] : List<dynamic>.from(elements!.map((x) => x.toJson())),
  };
}

class Element {
  String id;
  String styleName;
  List<Color> colors;

  Element({
    required this.id,
    required this.styleName,
    required this.colors,
  });

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    id: json["id"],
    styleName: json["styleName"],
    colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "styleName": styleName,
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
  };
}

class Color {
  String id;
  String url;
  bool isUnlocked;
  bool isSelected;
  int price;

  Color({
    required this.id,
    required this.url,
    required this.isUnlocked,
    required this.isSelected,
    required this.price,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    id: json["id"],
    url: json["url"],
    isUnlocked: json["isUnlocked"],
    isSelected: json["isSelected"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "isUnlocked": isUnlocked,
    "isSelected": isSelected,
    "price": price,
  };
}
