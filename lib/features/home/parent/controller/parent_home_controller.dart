import 'package:get/get.dart';
import 'package:shalana07/core/utils/constants/image_path.dart';
import 'package:shalana07/features/home/parent/model/activity_model.dart';

class ParentHomeController extends GetxController {
final List<ChildMessage> messages = [
  ChildMessage(
    avatar: ImagePath.childAvatar,
    challengeName: "Reading Challenge",
    childName: "Calista Kimimela",
    message: "Hi Mom 😊, I’m working on my Reading challenge, but I need a little help to finish it....",
    time: "Today · 10:30 AM",
    isRead: false,
  ),
  ChildMessage(
    avatar: ImagePath.childAvatar,
    challengeName: "Calista Kimimela Completed “Writing Challenge” Earned 10 Coins",
    childName: "Calista Kimimela",
    message: "",
    time: "Yesterday · 03:45 PM",
    isRead: false,
  ),
  ChildMessage(
    avatar: ImagePath.childAvatar,
    challengeName: "Science Challenge",
    childName: "Emma Williams",
    message: "Mom, I am stuck on the Science challenge, can you help me?",
    time: "Yesterday · 09:20 AM",
    isRead: true,
  ),
];

}