// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  bool success;
  String message;
  List<Datum> data;

  StoreModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String styleId;
  String assetImage;
  String assetImgPath;
  String colorName;
  dynamic description;
  String gender;
  int price;
  String rarity;
  bool isStarter;
  int purchased;
  DateTime createdAt;
  Style style;

  Datum({
    required this.id,
    required this.styleId,
    required this.assetImage,
    required this.assetImgPath,
    required this.colorName,
    required this.description,
    required this.gender,
    required this.price,
    required this.rarity,
    required this.isStarter,
    required this.purchased,
    required this.createdAt,
    required this.style,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    styleId: json["styleId"],
    assetImage: json["assetImage"],
    assetImgPath: json["assetImgPath"],
    colorName: json["colorName"],
    description: json["description"],
    gender: json["gender"],
    price: json["price"],
    rarity: json["rarity"],
    isStarter: json["isStarter"],
    purchased: json["purchased"],
    createdAt: DateTime.parse(json["createdAt"]),
    style: Style.fromJson(json["style"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "styleId": styleId,
    "assetImage": assetImage,
    "assetImgPath": assetImgPath,
    "colorName": colorName,
    "description": description,
    "gender": gender,
    "price": price,
    "rarity": rarity,
    "isStarter": isStarter,
    "purchased": purchased,
    "createdAt": createdAt.toIso8601String(),
    "style": style.toJson(),
  };
}

class Style {
  String id;
  String categoryId;
  String styleName;
  String description;
  DateTime createdAt;
  Category category;

  Style({
    required this.id,
    required this.categoryId,
    required this.styleName,
    required this.description,
    required this.createdAt,
    required this.category,
  });

  factory Style.fromJson(Map<String, dynamic> json) => Style(
    id: json["id"],
    categoryId: json["categoryId"],
    styleName: json["styleName"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryId": categoryId,
    "styleName": styleName,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "category": category.toJson(),
  };
}

class Category {
  String id;
  String avatarId;
  String type;

  Category({
    required this.id,
    required this.avatarId,
    required this.type,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    avatarId: json["avatarId"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatarId": avatarId,
    "type": type,
  };
}
