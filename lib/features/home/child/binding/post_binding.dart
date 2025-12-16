// bindings/post_binding.dart
import 'package:get/get.dart';
import 'package:shalana07/features/home/child/controllers/post_controller.dart';
import 'package:shalana07/features/home/child/service/post_service.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    // ✅ Corrected: removed trailing spaces
    const baseUrl = 'https://ligth-backend.up.railway.app/api';

    Get.lazyPut<PostService>(() => PostService(baseUrl: baseUrl));
    Get.lazyPut<PostController>(() => PostController(Get.find()));
  }
}