// services/post_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shalana07/features/home/child/model/post_model.dart';


class PostService {
  final String baseUrl;

  PostService({required this.baseUrl});

  Future<PostFeedResponse> fetchPosts({int page = 1, int limit = 10}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts?page=$page&limit=$limit'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponse.fromJson(json, (data) => PostFeedResponse.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> createPost(PostRequest request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponse.fromJson(json, (data) => Post.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(String postId, PostRequest request) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/posts/$postId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponse.fromJson(json, (data) => Post.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost(String postId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/$postId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }

  Future<Comment> addCommentToPost(String postId, String content) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts/$postId/comments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'content': content}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponse.fromJson(json, (data) => Comment.fromJson(data));
      return apiResponse.data!;
    } else {
      throw Exception('Failed to add comment');
    }
  }

  Future<void> deleteComment(String commentId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/comments/$commentId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
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