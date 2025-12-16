import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/daily_goal/child/model/child_goal_model.dart';
import 'package:shalana07/features/daily_goal/parent/model/parent_goal_model.dart';
import 'package:shalana07/features/home/child/controllers/child_home_screen_controller.dart';

import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/constants/api_constants.dart';

class ChildDailyGoalController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  var tabIndex = 1.obs;

  RxString goalFilter = 'Daily'.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }


  Future<void> startTask(String id) async {
    final token = StorageService.token;

    var response = await _networkCaller.postRequest(
      "${Api.baseUrl}/goals/start-task/$id",
      body: {},
      token: token,
    );

    if(response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if(await tokenService.refreshToken()) {
        final newToken = StorageService.token;
        response = await _networkCaller.postRequest(
          "${Api.baseUrl}/goals/start-task/$id",
          body: {},
          token: newToken,
        );
      }
    }

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      return;
    }

    Get.snackbar("Success", "Task started successfully");

    Get.find<ChildHomeScreenController>().getChildGoals();
  }

}