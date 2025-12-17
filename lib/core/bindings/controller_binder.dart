import 'package:get/get.dart';
import 'package:shalana07/core/common/service/token_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/home/child/model/post_service.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logincontroller>(
      () => Logincontroller(),
      // fenix: true,
    );

    Get.lazyPut<TokenService>(
      () => TokenService(),
      // fenix: true,
    );

    Get.lazyPut<PostService>(
      () => PostService(baseUrl: Api.baseUrl),
      // fenix: true,
    );
  }
}
