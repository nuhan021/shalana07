// To parse this JSON data, do
//
//     final childGoalModel = childGoalModelFromJson(jsonString);

import 'dart:convert';

ChildGoalsModel childGoalModelFromJson(String str) => ChildGoalsModel.fromJson(json.decode(str));

String childGoalModelToJson(ChildGoalsModel data) => json.encode(data.toJson());

class ChildGoalsModel {
  bool success;
  String message;
  List<Datum> data;

  ChildGoalsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ChildGoalsModel.fromJson(Map<String, dynamic> json) => ChildGoalsModel(
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
  String goalId;
  String childId;
  int minutesCompleted;
  int progressAvg;
  int percentage;
  dynamic lastResetAt;
  DateTime lastUpdatedAt;
  bool isDeleted;
  Goal goal;

  Datum({
    required this.id,
    required this.goalId,
    required this.childId,
    required this.minutesCompleted,
    required this.progressAvg,
    required this.percentage,
    required this.lastResetAt,
    required this.lastUpdatedAt,
    required this.isDeleted,
    required this.goal,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    goalId: json["goalId"],
    childId: json["childId"],
    minutesCompleted: json["minutesCompleted"],
    progressAvg: json["progressAvg"],
    percentage: json["percentage"],
    lastResetAt: json["lastResetAt"],
    lastUpdatedAt: DateTime.parse(json["lastUpdatedAt"]),
    isDeleted: json["isDeleted"],
    goal: Goal.fromJson(json["goal"]),
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
    "goal": goal.toJson(),
  };
}

class Goal {
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

  Goal({
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
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
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
  };
}
