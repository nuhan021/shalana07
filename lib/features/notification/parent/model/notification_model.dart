class NotificationModel {
  final String avatar;
  final String challengeName;
  final String childName;
  final String message;
  final String time;
  final bool isRead;

  NotificationModel({
    required this.avatar,
    required this.challengeName,
    required this.childName,
    required this.message,
    required this.time,
    required this.isRead,
  });

  // Optional: factory constructor to create from JSON map
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      avatar: json['avatar'],
      challengeName: json['challengeName'],
      childName: json['childName'],
      message: json['message'],
      time: json['time'],
      isRead: json['isRead'],
    );
  }

  // Optional: convert back to JSON
  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'challengeName': challengeName,
      'childName': childName,
      'message': message,
      'time': time,
      'isRead': isRead,
    };
  }
}
