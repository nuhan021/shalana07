// controllers/post_controller.dart
import 'package:get/get.dart';
import 'package:shalana07/features/home/child/model/post_model.dart';
import 'package:shalana07/features/home/child/model/post_service.dart';

class PostController extends GetxController {
  final PostService _postService;
  final RxList<Post> _posts = <Post>[].obs;
  final RxBool _loading = false.obs;
  final RxString _error = ''.obs;

  List<Post> get posts => _posts.toList();
  bool get loading => _loading.value;
  String get error => _error.value;

  PostController(this._postService);

  Future<void> loadPosts({int page = 1, int limit = 10}) async {
    _loading.value = true;
    _error.value = '';
    try {
      final response = await _postService.fetchPosts(page: page, limit: limit);
      _posts.assignAll(response.data);
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _loading.value = false;
    }
  }

  Future<void> createPost(PostRequest request) async {
    try {
      final post = await _postService.createPost(request);
      _posts.insert(0, post);
    } catch (e) {
      _error.value = e.toString();
    }
  }

  Future<void> updatePost(String postId, PostRequest request) async {
    try {
      final updated = await _postService.updatePost(postId, request);
      final index = _posts.indexWhere((p) => p.id == postId);
      if (index != -1) _posts[index] = updated;
    } catch (e) {
      _error.value = e.toString();
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _postService.deletePost(postId);
      _posts.removeWhere((p) => p.id == postId);
    } catch (e) {
      _error.value = e.toString();
    }
  }

  Future<void> addComment(String postId, String content) async {
    try {
      final comment = await _postService.addCommentToPost(postId, content);
      // Optionally update post comment count or refetch
      // For simplicity: just reload
      loadPosts();
    } catch (e) {
      _error.value = e.toString();
    }
  }

  Future<void> deleteComment(String commentId) async {
    try {
      await _postService.deleteComment(commentId);
      loadPosts();
    } catch (e) {
      _error.value = e.toString();
    }
  }
}