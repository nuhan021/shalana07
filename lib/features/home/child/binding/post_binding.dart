// bindings/post_binding.dart
import 'package:get/get.dart';
import 'package:shalana07/features/home/child/controllers/post_controller.dart';
import 'package:shalana07/features/home/child/service/post_service.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostService>(() => PostService());
    Get.lazyPut<PostController>(() => PostController(Get.find()));
  }
}