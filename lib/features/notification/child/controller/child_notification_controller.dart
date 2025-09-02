import 'package:get/get.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/notification/child/model/child_notification_model.dart';


class ChildNotificationController extends GetxController{
    var isLoading = false.obs;
    var isLoadingRewards = false.obs;


    // List of notifications
  final List<ChildNotificationModel> updatesNotifications = [
  ChildNotificationModel(
    avatar: ImagePath.childAvatar,
    challengeName: "parent Response",
    childName: "Writing Challenge",
    message: "Mom: Of course! I’ll sit with you after work and help finish your writing task.",
    time: "Today · 10:30 AM",
    isRead: false,
  ),
 ChildNotificationModel(
    avatar: ImagePath.childAvatar,
    challengeName: "Math Challenge",
    childName: "Calista Kimimela",
    message: "",
    time: "Yesterday · 03:45 PM",
    isRead: false,
  ),
  ChildNotificationModel(
    avatar: ImagePath.childAvatar,
    challengeName: "Science Challenge",
    childName: "Emma Williams",
    message: "Mom, I am stuck on the Science challenge, can you help me?",
    time: "Yesterday · 09:20 AM",
    isRead: true,
  ),
];


final List<ChildNotificationModel> rewardsNotifications = [
  ChildNotificationModel(
    avatar: ImagePath.childAvatar,
    challengeName: "Gift Received: 🎁",
    childName: "Writing Challenge",
    message: "Nice job! You have completed the writing challenge.",
    time: "Today · 10:30 AM",
    isRead: false,
  ),
 ChildNotificationModel(
    avatar: ImagePath.childAvatar,
    challengeName: "Math Challenge gift : 🎁",
    childName: "Calista Kimimela",
    message: "",
    time: "Yesterday · 03:45 PM",
    isRead: false,
  ),
  ChildNotificationModel(
    avatar: ImagePath.childAvatar,
    challengeName: "Science Challenge",
    childName: "Emma Williams",
    message: "Mom, I am stuck on the Science challenge, can you help me?",
    time: "Yesterday · 09:20 AM",
    isRead: true,
  ),
];



  void loadMore() {
    isLoading.value = true;

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  void loadMoreRewards() {
   isLoadingRewards.value = true;

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingRewards.value = false;
    });
  }
}

