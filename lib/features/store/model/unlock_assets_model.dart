// To parse this JSON data, do
//
//     final unlockAssetModel = unlockAssetModelFromJson(jsonString);

import 'dart:convert';

UnlockAssetModel unlockAssetModelFromJson(String str) => UnlockAssetModel.fromJson(json.decode(str));

String unlockAssetModelToJson(UnlockAssetModel data) => json.encode(data.toJson());

class UnlockAssetModel {
  bool success;
  String message;
  Data data;

  UnlockAssetModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UnlockAssetModel.fromJson(Map<String, dynamic> json) => UnlockAssetModel(
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
  int unlockedCount;
  List<String> alreadyOwnedIds;

  Data({
    required this.unlockedCount,
    required this.alreadyOwnedIds,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    unlockedCount: json["unlockedCount"],
    alreadyOwnedIds: List<String>.from(json["alreadyOwnedIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "unlockedCount": unlockedCount,
    "alreadyOwnedIds": List<dynamic>.from(alreadyOwnedIds.map((x) => x)),
  };
}
