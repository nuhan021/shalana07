import 'package:get/get.dart';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/core/utils/logging/logger.dart';

class TokenService extends GetxService {
  final NetworkCaller _networkCaller = NetworkCaller();

  /// Call this to refresh token when you get 401
  Future<bool> refreshToken() async {
    final refreshToken = StorageService.refreshToken;
    final userId = StorageService.userId;

    AppLoggerHelper.debug("the refresh token is: $refreshToken");

    if (refreshToken == null) return false;

    final response = await _networkCaller.postRequest(
      "${Api.baseUrl}/auth/refresh-token",
      body: {},
      token: refreshToken,
      isCookie: true
    );

    AppLoggerHelper.debug("The response IS------> ${response.responseData}");

    if (!response.isSuccess) {
      AppLoggerHelper.debug("Refresh token failed: ${response.errorMessage}");
      return false;
    }

    // Save new tokens
    final newAccessToken = response.responseData['data']['accessToken'];

    await StorageService.saveToken(newAccessToken, userId!);

    AppLoggerHelper.debug("Access token refreshed successfully");
    return true;
  }
}
