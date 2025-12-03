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
  String id;
  String email;
  String password;
  String role;
  DateTime createdAt;
  dynamic otp;
  bool isDeleted;
  dynamic otpExpiresAt;
  bool isVerified;
  dynamic passwordResetOtp;
  dynamic passwordResetExpires;
  ChildProfile childProfile;

  Data({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.otp,
    required this.isDeleted,
    required this.otpExpiresAt,
    required this.isVerified,
    required this.passwordResetOtp,
    required this.passwordResetExpires,
    required this.childProfile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    createdAt: DateTime.parse(json["createdAt"]),
    otp: json["otp"],
    isDeleted: json["isDeleted"],
    otpExpiresAt: json["otp_expires_at"],
    isVerified: json["is_verified"],
    passwordResetOtp: json["password_reset_otp"],
    passwordResetExpires: json["password_reset_expires"],
    childProfile: ChildProfile.fromJson(json["childProfile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "role": role,
    "createdAt": createdAt.toIso8601String(),
    "otp": otp,
    "isDeleted": isDeleted,
    "otp_expires_at": otpExpiresAt,
    "is_verified": isVerified,
    "password_reset_otp": passwordResetOtp,
    "password_reset_expires": passwordResetExpires,
    "childProfile": childProfile.toJson(),
  };
}

class ChildProfile {
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
  Parent parent;

  ChildProfile({
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
    required this.parent,
  });

  factory ChildProfile.fromJson(Map<String, dynamic> json) => ChildProfile(
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
    parent: Parent.fromJson(json["parent"]),
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
    "parent": parent.toJson(),
  };
}

class Parent {
  String id;
  String userId;
  String name;
  String phone;
  String image;
  String imagePath;
  dynamic relation;
  dynamic dateOfBirth;
  String location;
  bool isDeleted;
  int giftedCoins;
  bool pushNotification;
  bool dailyReminders;
  bool childTaskUpdates;

  Parent({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.image,
    required this.imagePath,
    required this.relation,
    required this.dateOfBirth,
    required this.location,
    required this.isDeleted,
    required this.giftedCoins,
    required this.pushNotification,
    required this.dailyReminders,
    required this.childTaskUpdates,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    id: json["id"],
    userId: json["userId"],
    name: json["name"],
    phone: json["phone"],
    image: json["image"],
    imagePath: json["imagePath"],
    relation: json["relation"],
    dateOfBirth: json["dateOfBirth"],
    location: json["location"],
    isDeleted: json["isDeleted"],
    giftedCoins: json["giftedCoins"],
    pushNotification: json["pushNotification"],
    dailyReminders: json["dailyReminders"],
    childTaskUpdates: json["childTaskUpdates"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "name": name,
    "phone": phone,
    "image": image,
    "imagePath": imagePath,
    "relation": relation,
    "dateOfBirth": dateOfBirth,
    "location": location,
    "isDeleted": isDeleted,
    "giftedCoins": giftedCoins,
    "pushNotification": pushNotification,
    "dailyReminders": dailyReminders,
    "childTaskUpdates": childTaskUpdates,
  };
}
