import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/daily_goal/parent/model/parent_goal_model.dart';

class ParentDailyGoalController extends GetxController {
  var tabIndex = 1.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }


  //hard coded model when api come just replease it
  final goals = [
  GoalModel(
    name: "Writing Challenge",
    progress: 0.5,
    coinsPerDay: 10,
    status: "Active",
  ),
  GoalModel(
    name: "Reading Challenge",
    progress: 0.3,
    coinsPerDay: 15,
    status: "Active",
  ),
  GoalModel(
    name: "Avater Challenge",
    progress: 0.8,
    coinsPerDay: 5,
    status: "Pause",
  ),
  GoalModel(
    name: "Avater completed",
    progress: 0.6,
    coinsPerDay: 20,
    status: "Active",
  ),
  GoalModel(
    name: "Hair add Challenge",
    progress: 0.2,
    coinsPerDay: 25,
    status: "Pause",
  ),
  GoalModel(
    name: "Hair add Challenge",
    progress: 0.2,
    coinsPerDay: 25,
    status: "Pause",
  ),
  GoalModel(
    name: "Hair add Challenge",
    progress: 0.2,
    coinsPerDay: 25,
    status: "Pause",
  ),
];

}