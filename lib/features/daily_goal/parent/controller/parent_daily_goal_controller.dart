import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/daily_goal/parent/model/parent_goal_model.dart';

import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/storage_service.dart';
import '../model/ParentGoalModel.dart';

class ParentDailyGoalController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  @override
  void onInit() {
    super.onInit();
    getGoal();
  }

  Future<void> getGoal() async {
    isGoalLoading.value = true;
    final token = StorageService.token;

    var response = await _networkCaller.getRequest(
      "${Api.baseUrl}/goals/parent-goals",
      token: token,
    );

    if (response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if (await tokenService.refreshToken()) {
        response = await _networkCaller.getRequest(
          "${Api.baseUrl}/goals/parent-goals",
          token: token,
        );
      }
    }

    isGoalLoading.value = false;

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      isGoalError.value = true;
      return;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Success message
      final model = ParentGoals.fromJson(response.responseData);
      parentGoals.value = model;
      goals.clear();
      parentGoals.value?.data.forEach(
            (goal) => goals.add(
          GoalModel(
            id: goal.id,
            name: goal.title,
            progress: goal.progress.toDouble(),
            coinsPerDay: goal.rewardCoins,
            status: goal.status,
          ),
        ),
      );

      AppLoggerHelper.debug(goals.toString());

      Get.snackbar(
        "Success",
        "Success to fetch goals",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return;
    } else {
      // Error message
      Get.snackbar(
        "Error",
        response.errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
  }

  RxBool isGoalError = false.obs;

  Rx<ParentGoals?> parentGoals = Rx<ParentGoals?>(null);

  RxBool isGoalLoading = false.obs;

  var tabIndex = 1.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  //hard coded model when api come just replease it
  RxList<GoalModel> goals = <GoalModel>[].obs;
}
