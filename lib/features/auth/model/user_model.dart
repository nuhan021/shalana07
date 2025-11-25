// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool success;
  String message;
  Data data;

  UserModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  String name;
  String phone;
  dynamic image;
  dynamic imagePath;
  dynamic relation;
  dynamic dateOfBirth;
  dynamic location;
  bool isDeleted;
  int giftedCoins;
  bool pushNotification;
  bool dailyReminders;
  bool childTaskUpdates;
  List<Child> children;

  Profile({
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
    required this.children,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    children: json["children"] == null
        ? <Child>[]
        : List<Child>.from(
        (json["children"] as List<dynamic>).map((x) => Child.fromJson(x as Map<String, dynamic>))
    ),
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
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

// child_model.dart

class Child {
  String id;
  String userId;
  String parentId;
  String accountType;
  String name;
  String gender;
  String phone;
  String email;
  String dateOfBirth;
  String location;
  String? image;
  String? imagePath;
  int coins;
  String relation;
  bool editProfile;
  bool createGoals;
  bool approveTasks;
  bool deleteGoals;
  bool deleteAccount;
  String? avatarId;
  bool isDeleted;

  Child({
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
    this.image,
    this.imagePath,
    required this.coins,
    required this.relation,
    required this.editProfile,
    required this.createGoals,
    required this.approveTasks,
    required this.deleteGoals,
    required this.deleteAccount,
    this.avatarId,
    required this.isDeleted,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    id: json["id"],
    userId: json["userId"],
    parentId: json["parentId"],
    accountType: json["accountType"],
    name: json["name"],
    gender: json["gender"],
    phone: json["phone"],
    email: json["email"],
    dateOfBirth: json["dateOfBirth"],
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
    "dateOfBirth": dateOfBirth,
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


