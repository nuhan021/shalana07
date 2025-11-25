// To parse this JSON data, do
//
//     final childModel = childModelFromJson(jsonString);

import 'dart:convert';

ChildModel childModelFromJson(String str) => ChildModel.fromJson(json.decode(str));

String childModelToJson(ChildModel data) => json.encode(data.toJson());

class ChildModel {
  bool success;
  String message;
  Data data;

  ChildModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) => ChildModel(
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
  User user;
  String accessToken;
  String refreshToken;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class User {
  String id;
  String email;
  String role;
  Profile profile;

  User({
    required this.id,
    required this.email,
    required this.role,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    role: json["role"],
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "role": role,
    "profile": profile.toJson(),
  };
}

class Profile {
  String id;
  String userId;
  String parentId;
  String accountType;
  String name;
  String gender;
  String phone;
  String email;
  DateTime dateOfBirth;
  String location;
  String image;
  String imagePath;
  int coins;
  String relation;
  bool editProfile;
  bool createGoals;
  bool approveTasks;
  bool deleteGoals;
  bool deleteAccount;
  dynamic avatarId;
  bool isDeleted;

  Profile({
    required this.id,
    required this.userId,
    required this.parentId,
    required this.accountType,
    required this.name,
    required this.gender,
    required this.phone,
    required this.email,
    required this.dateOfBirth,
    required this.location,
    required this.image,
    required this.imagePath,
    required this.coins,
    required this.relation,
    required this.editProfile,
    required this.createGoals,
    required this.approveTasks,
    required this.deleteGoals,
    required this.deleteAccount,
    required this.avatarId,
    required this.isDeleted,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    userId: json["userId"],
    parentId: json["parentId"],
    accountType: json["accountType"],
    name: json["name"],
    gender: json["gender"],
    phone: json["phone"],
    email: json["email"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    location: json["location"],
    image: json["image"],
    imagePath: json["imagePath"],
    coins: json["coins"],
    relation: json["relation"],
    editProfile: json["editProfile"],
    createGoals: json["createGoals"],
    approveTasks: json["approveTasks"],
    deleteGoals: json["deleteGoals"],
    deleteAccount: json["deleteAccount"],
    avatarId: json["avatarId"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "parentId": parentId,
    "accountType": accountType,
    "name": name,
    "gender": gender,
    "phone": phone,
    "email": email,
    "dateOfBirth": dateOfBirth.toIso8601String(),
    "location": location,
    "image": image,
    "imagePath": imagePath,
    "coins": coins,
    "relation": relation,
    "editProfile": editProfile,
    "createGoals": createGoals,
    "approveTasks": approveTasks,
    "deleteGoals": deleteGoals,
    "deleteAccount": deleteAccount,
    "avatarId": avatarId,
    "isDeleted": isDeleted,
  };
}
