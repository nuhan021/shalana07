import 'package:get/get.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/notification/child/model/notification_model.dart';


class ChildNotificationController extends GetxController{
    var isLoading = false.obs;


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
    challengeName: "Calista Kimimela Completed “Writing Challenge” Earned 10 Coins",
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
    isLoading.value = true;

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}

