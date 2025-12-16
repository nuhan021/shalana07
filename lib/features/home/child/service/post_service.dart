import 'dart:convert';
import 'package:shalana07/core/services/network_caller.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/constants/api_constants.dart';
import 'package:shalana07/features/home/child/model/post_model.dart';

class PostService {
  final NetworkCaller _networkCaller = NetworkCaller();

  Future<PostFeedResponse> fetchPosts({int page = 1, int limit = 10}) async {
    final response = await _networkCaller.getRequest(
      '${Api.baseUrl}/posts?page=$page&limit=$limit',
      token: StorageService.token,
    );

    if (response.isSuccess) {
      final apiResponse = ApiResponse.fromJson(response.responseData, (data) => PostFeedResponse.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> createPost(PostRequest request) async {
    final response = await _networkCaller.postRequest(
      '${Api.baseUrl}/posts',
      body: request.toJson(),
      token: StorageService.token,
    );

    if (response.isSuccess) {
      final apiResponse = ApiResponse.fromJson(response.responseData, (data) => Post.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(String postId, PostRequest request) async {
    final response = await _networkCaller.patchRequest(
      '${Api.baseUrl}/posts/$postId',
      body: request.toJson(),
      token: StorageService.token,
    );

    if (response.isSuccess) {
      final apiResponse = ApiResponse.fromJson(response.responseData, (data) => Post.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost(String postId) async {
    final response = await _networkCaller.deleteRequest(
      '${Api.baseUrl}/posts/$postId',
      token: StorageService.token,
    );

    if (!response.isSuccess) {
      throw Exception('Failed to delete post');
    }
  }

  Future<Comment> addCommentToPost(String postId, String content) async {
    final response = await _networkCaller.postRequest(
      '${Api.baseUrl}/posts/$postId/comments',
      body: {'content': content},
      token: StorageService.token,
    );

    if (response.isSuccess) {
      final apiResponse = ApiResponse.fromJson(response.responseData, (data) => Comment.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to add comment');
    }
  }

  Future<void> deleteComment(String commentId) async {
    final response = await _networkCaller.deleteRequest(
      '${Api.baseUrl}/posts/comments/$commentId',
      token: StorageService.token,
    );

    if (!response.isSuccess) {
      throw Exception('Failed to delete comment');
    }
  }
}

// Optional: Add Comment model if needed for future use
class Comment {
  final String id;
  final String postId;
  final String authorId;
  final String authorRole;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Author author;

  Comment({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.authorRole,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json['id'],
    postId: json['postId'],
    authorId: json['authorId'],
    authorRole: json['authorRole'],
    content: json['content'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    author: Author.fromJson(json['author']),
  );
}