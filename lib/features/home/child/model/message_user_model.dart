class MessageUserModel {
  final String name;
  final String role;
  final String message;
  final String time;
  final int unread;
  final String initials;
  final bool active;

  MessageUserModel({
    required this.name,
    required this.role,
    required this.message,
    required this.time,
    required this.unread,
    required this.initials,
    required this.active,
  });

  factory MessageUserModel.fromJson(Map<String, dynamic> json) {
    return MessageUserModel(
      name: json["name"] ?? "",
      role: json["role"] ?? "",
      message: json["message"] ?? "",
      time: json["time"] ?? "",
      unread: json["unread"] ?? 0,
      initials: json["initials"] ?? "",
      active: json["active"] ?? false,
    );
  }
}