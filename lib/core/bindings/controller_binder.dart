import 'package:get/get.dart';
import 'package:shalana07/core/common/service/token_service.dart';
import 'package:shalana07/features/auth/controller/loginController.dart';
import 'package:shalana07/features/profile/parent/controller/parent_profile_controller.dart';

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
  }
}
