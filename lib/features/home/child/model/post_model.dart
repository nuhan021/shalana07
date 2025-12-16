// models/post_model.dart

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;

  ApiResponse({required this.success, required this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return ApiResponse<T>(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? fromJson(json['data']) : null,
    );
  }
}

class PostFeedResponse {
  final List<Post> data;
  final Meta meta;

  PostFeedResponse({required this.data, required this.meta});

  factory PostFeedResponse.fromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List;
    return PostFeedResponse(
      data: dataList.map((e) => Post.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPages;

  Meta({required this.page, required this.limit, required this.total, required this.totalPages});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        page: json['page'],
        limit: json['limit'],
        total: json['total'],
        totalPages: json['totalPages'],
      );
}

class Post {
  final String id;
  final String authorId;
  final String authorRole;
  final String? title;
  final String content;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentsCount;
  final Author author;

  Post({
    required this.id,
    required this.authorId,
    required this.authorRole,
    this.title,
    required this.content,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.author,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'],
        authorId: json['authorId'],
        authorRole: json['authorRole'],
        title: json['title'],
        content: json['content'],
        description: json['description'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        commentsCount: json['_count']['comments'] ?? 0,
        author: Author.fromJson(json['author']),
      );
}

class Author {
  final String id;
  final String role;
  final ParentProfile? parentProfile;
  final ChildProfile? childProfile;

  Author({
    required this.id,
    required this.role,
    this.parentProfile,
    this.childProfile,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json['id'],
        role: json['role'],
        parentProfile: json['parentProfile'] != null
            ? ParentProfile.fromJson(json['parentProfile'])
            : null,
        childProfile: json['childProfile'] != null
            ? ChildProfile.fromJson(json['childProfile'])
            : null,
      );

  String get displayName => parentProfile?.name ?? childProfile?.name ?? 'Anonymous';
  String? get imageUrl => parentProfile?.image ?? childProfile?.image;
}

class ParentProfile {
  final String id;
  final String name;
  final String? image;

  ParentProfile({required this.id, required this.name, this.image});

  factory ParentProfile.fromJson(Map<String, dynamic> json) => ParentProfile(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}

class ChildProfile {
  final String id;
  final String name;
  final String? image;

  ChildProfile({required this.id, required this.name, this.image});

  factory ChildProfile.fromJson(Map<String, dynamic> json) => ChildProfile(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}

// For POST/PATCH
class PostRequest {
  final String? title;
  final String content;
  final String? description;

  PostRequest({this.title, required this.content, this.description});

  Map<String, dynamic> toJson() => {
        if (title != null) 'title': title,
        'content': content,
        if (description != null) 'description': description,
      };
}