import 'package:get/get.dart';
import 'package:shalana07/core/utils/logging/logger.dart';
import 'package:shalana07/features/daily_goal/child/model/child_goal_model.dart';
import 'package:shalana07/features/home/child/model/child_goal_model.dart';

import '../../../../core/common/service/token_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/constants/api_constants.dart';

class ChildHomeScreenController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  @override
  void onInit() {
    super.onInit();
    getChildGoals();
  }


  void toggleIsAvatarTab(int index) {
    selectedTab.value = index;
  }

  Future<void> getChildGoals() async {
    isChildLoading.value = true;
    final token = StorageService.token;

    var response = await _networkCaller.getRequest(
      "${Api.baseUrl}/goals/child-goals",
      token: token,
    );

    if(response.statusCode == 401) {
      final tokenService = Get.find<TokenService>();
      if(await tokenService.refreshToken()) {
        response = await _networkCaller.getRequest(
          "${Api.baseUrl}/goals/child-goals",
          token: token,
        );
      }
    }

    isChildLoading.value = false;

    if (!response.isSuccess) {
      Get.snackbar("Error", response.errorMessage);
      isChildError.value = true;
      return;
    }
    final model = ChildGoalsModel.fromJson(response.responseData);
    childGoalModel.value = model;
    isChildError.value = false;
  }


  RxInt selectedTab = 0.obs;
  RxBool isChildLoading = false.obs;
  RxBool isChildError = false.obs;
  Rx<ChildGoalsModel?> childGoalModel = Rx<ChildGoalsModel?>(null);

}