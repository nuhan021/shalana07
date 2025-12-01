// To parse this JSON data, do
//
//     final parentGoals = parentGoalsFromJson(jsonString);

import 'dart:convert';

ParentGoals parentGoalsFromJson(String str) => ParentGoals.fromJson(json.decode(str));

String parentGoalsToJson(ParentGoals data) => json.encode(data.toJson());

class ParentGoals {
  bool success;
  String message;
  List<Datum> data;

  ParentGoals({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ParentGoals.fromJson(Map<String, dynamic> json) => ParentGoals(
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
  String authorId;
  String authorRole;
  String title;
  String description;
  String type;
  String status;
  int rewardCoins;
  DateTime startDate;
  DateTime endDate;
  int durationMin;
  int progress;
  int progressAvg;
  DateTime createdAt;
  bool isDeleted;
  bool isRecurring;
  dynamic nextResetAt;
  List<AssignedChild> assignedChildren;
  int averageProgress;
  int totalProgress;
  int completedCount;
  int totalChildren;

  Datum({
    required this.id,
    required this.authorId,
    required this.authorRole,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    required this.rewardCoins,
    required this.startDate,
    required this.endDate,
    required this.durationMin,
    required this.progress,
    required this.progressAvg,
    required this.createdAt,
    required this.isDeleted,
    required this.isRecurring,
    required this.nextResetAt,
    required this.assignedChildren,
    required this.averageProgress,
    required this.totalProgress,
    required this.completedCount,
    required this.totalChildren,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    authorId: json["authorId"],
    authorRole: json["authorRole"],
    title: json["title"],
    description: json["description"],
    type: json["type"],
    status: json["status"],
    rewardCoins: json["rewardCoins"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    durationMin: json["durationMin"],
    progress: json["progress"],
    progressAvg: json["progressAvg"],
    createdAt: DateTime.parse(json["createdAt"]),
    isDeleted: json["isDeleted"],
    isRecurring: json["isRecurring"],
    nextResetAt: json["nextResetAt"],
    assignedChildren: List<AssignedChild>.from(json["assignedChildren"].map((x) => AssignedChild.fromJson(x))),
    averageProgress: json["averageProgress"],
    totalProgress: json["totalProgress"],
    completedCount: json["completedCount"],
    totalChildren: json["totalChildren"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "authorId": authorId,
    "authorRole": authorRole,
    "title": title,
    "description": description,
    "type": type,
    "status": status,
    "rewardCoins": rewardCoins,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "durationMin": durationMin,
    "progress": progress,
    "progressAvg": progressAvg,
    "createdAt": createdAt.toIso8601String(),
    "isDeleted": isDeleted,
    "isRecurring": isRecurring,
    "nextResetAt": nextResetAt,
    "assignedChildren": List<dynamic>.from(assignedChildren.map((x) => x.toJson())),
    "averageProgress": averageProgress,
    "totalProgress": totalProgress,
    "completedCount": completedCount,
    "totalChildren": totalChildren,
  };
}

class AssignedChild {
  String id;
  String goalId;
  String childId;
  int minutesCompleted;
  int progressAvg;
  int percentage;
  dynamic lastResetAt;
  DateTime lastUpdatedAt;
  bool isDeleted;
  Child child;

  AssignedChild({
    required this.id,
    required this.goalId,
    required this.childId,
    required this.minutesCompleted,
    required this.progressAvg,
    required this.percentage,
    required this.lastResetAt,
    required this.lastUpdatedAt,
    required this.isDeleted,
    required this.child,
  });

  factory AssignedChild.fromJson(Map<String, dynamic> json) => AssignedChild(
    id: json["id"],
    goalId: json["goalId"],
    childId: json["childId"],
    minutesCompleted: json["minutesCompleted"],
    progressAvg: json["progressAvg"],
    percentage: json["percentage"],
    lastResetAt: json["lastResetAt"],
    lastUpdatedAt: DateTime.parse(json["lastUpdatedAt"]),
    isDeleted: json["isDeleted"],
    child: Child.fromJson(json["child"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "goalId": goalId,
    "childId": childId,
    "minutesCompleted": minutesCompleted,
    "progressAvg": progressAvg,
    "percentage": percentage,
    "lastResetAt": lastResetAt,
    "lastUpdatedAt": lastUpdatedAt.toIso8601String(),
    "isDeleted": isDeleted,
    "child": child.toJson(),
  };
}

class Child {
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

  factory Child.fromJson(Map<String, dynamic> json) => Child(
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
