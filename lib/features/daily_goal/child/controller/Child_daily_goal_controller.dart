import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/daily_goal/child/model/child_goal_model.dart';
import 'package:shalana07/features/daily_goal/parent/model/parent_goal_model.dart';

class ChildDailyGoalController extends GetxController {
  var tabIndex = 1.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }


  //hard coded model when api come just replease it
  final goals = [
  ChildGoalModel(
    name: "Writing Challenge",
    progress: 0.5,
    coinsPerDay: 10,
    status: "Active",
  ),
  
  ChildGoalModel(
    name: "Reading Challenge",
    progress: 0.3,
    coinsPerDay: 15,
    status: "Active",
  ),
  ChildGoalModel(
    name: "Avater Challenge",
    progress: 0.8,
    coinsPerDay: 5,
    status: "Pause",
  ),
  ChildGoalModel(
    name: "Avater completed",
    progress: 0.6,
    coinsPerDay: 20,
    status: "Active",
  ),
ChildGoalModel(
    name: "Hair add Challenge",
    progress: 0.2,
    coinsPerDay: 25,
    status: "Pause",
  ),
 ChildGoalModel(
    name: "Hair add Challenge",
    progress: 0.2,
    coinsPerDay: 25,
    status: "Pause",
  ),
  ChildGoalModel(
    name: "Hair add Challenge",
    progress: 0.2,
    coinsPerDay: 25,
    status: "Pause",
  ),
];

}