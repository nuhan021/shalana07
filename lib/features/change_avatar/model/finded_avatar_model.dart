// To parse this JSON data, do
//
//     final findedAvatarModel = findedAvatarModelFromJson(jsonString);

import 'dart:convert';

FindedAvatarModel findedAvatarModelFromJson(String str) => FindedAvatarModel.fromJson(json.decode(str));

String findedAvatarModelToJson(FindedAvatarModel data) => json.encode(data.toJson());

class FindedAvatarModel {
  bool success;
  String message;
  List<Datum> data;

  FindedAvatarModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FindedAvatarModel.fromJson(Map<String, dynamic> json) => FindedAvatarModel(
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
  String avatarImgUrl;
  String avatarImgPath;
  String gender;
  String region;
  String description;
  int purchased;
  int price;
  DateTime createdAt;

  Datum({
    required this.id,
    required this.avatarImgUrl,
    required this.avatarImgPath,
    required this.gender,
    required this.region,
    required this.description,
    required this.purchased,
    required this.price,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    avatarImgUrl: json["avatarImgUrl"],
    avatarImgPath: json["avatarImgPath"],
    gender: json["gender"],
    region: json["region"],
    description: json["description"],
    purchased: json["purchased"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatarImgUrl": avatarImgUrl,
    "avatarImgPath": avatarImgPath,
    "gender": gender,
    "region": region,
    "description": description,
    "purchased": purchased,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
  };
}
