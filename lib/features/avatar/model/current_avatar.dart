// To parse this JSON data, do
//
//     final currentAvatar = currentAvatarFromJson(jsonString);

import 'dart:convert';

CurrentAvatar currentAvatarFromJson(String str) => CurrentAvatar.fromJson(json.decode(str));

String currentAvatarToJson(CurrentAvatar data) => json.encode(data.toJson());

class CurrentAvatar {
  bool success;
  String message;
  Data data;

  CurrentAvatar({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CurrentAvatar.fromJson(Map<String, dynamic> json) => CurrentAvatar(
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
  Equipped equipped;
  List<Equipped> unequipped;

  Data({
    required this.equipped,
    required this.unequipped,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    equipped: Equipped.fromJson(json["equipped"]),
    unequipped: List<Equipped>.from(json["unequipped"].map((x) => Equipped.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "equipped": equipped.toJson(),
    "unequipped": List<dynamic>.from(unequipped.map((x) => x.toJson())),
  };
}

class Equipped {
  String avatarId;
  String avatarImgUrl;
  String gender;
  String region;
  Accessory hair;
  Accessory dress;
  Accessory eyes;
  Accessory skin;
  Accessory nose;
  Accessory shoes;
  Accessory accessory;
  Accessory jewelry;
  Accessory pet;

  Equipped({
    required this.avatarId,
    required this.avatarImgUrl,
    required this.gender,
    required this.region,
    required this.hair,
    required this.dress,
    required this.eyes,
    required this.skin,
    required this.nose,
    required this.shoes,
    required this.accessory,
    required this.jewelry,
    required this.pet,
  });

  factory Equipped.fromJson(Map<String, dynamic> json) => Equipped(
    avatarId: json["avatarId"],
    avatarImgUrl: json["avatarImgUrl"],
    gender: json["gender"],
    region: json["region"],
    hair: Accessory.fromJson(json["hair"]),
    dress: Accessory.fromJson(json["dress"]),
    eyes: Accessory.fromJson(json["eyes"]),
    skin: Accessory.fromJson(json["skin"]),
    nose: Accessory.fromJson(json["nose"]),
    shoes: Accessory.fromJson(json["shoes"]),
    accessory: Accessory.fromJson(json["accessory"]),
    jewelry: Accessory.fromJson(json["jewelry"]),
    pet: Accessory.fromJson(json["pet"]),
  );

  Map<String, dynamic> toJson() => {
    "avatarId": avatarId,
    "avatarImgUrl": avatarImgUrl,
    "gender": gender,
    "region": region,
    "hair": hair.toJson(),
    "dress": dress.toJson(),
    "eyes": eyes.toJson(),
    "skin": skin.toJson(),
    "nose": nose.toJson(),
    "shoes": shoes.toJson(),
    "accessory": accessory.toJson(),
    "jewelry": jewelry.toJson(),
    "pet": pet.toJson(),
  };
}

class Accessory {
  Name name;
  List<Element>? elements;

  Accessory({
    required this.name,
    required this.elements,
  });

  factory Accessory.fromJson(Map<String, dynamic> json) => Accessory(
    name: nameValues.map[json["name"]]!,
    elements: json["elements"] == null ? [] : List<Element>.from(json["elements"]!.map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
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

enum Name {
  DRESS,
  EYES,
  HAIR,
  NULL
}

final nameValues = EnumValues({
  "Dress": Name.DRESS,
  "Eyes": Name.EYES,
  "Hair": Name.HAIR,
  "null": Name.NULL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
