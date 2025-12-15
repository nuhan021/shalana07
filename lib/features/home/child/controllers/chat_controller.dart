import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/chat_model.dart';

class ChatController extends GetxController {
  final messages = <ChatModel>[].obs;
  final textController = TextEditingController();
  final inputFocusNode = FocusNode();
  final isInputFocused = false.obs;

  @override
  void onInit() {
    loadDummyMessages();
    inputFocusNode.addListener(() {
      isInputFocused.value = inputFocusNode.hasFocus;
    });
    super.onInit();
  }

  void loadDummyMessages() {
    messages.value = [
      ChatModel(
        text: "Hey! How are you feeling after yesterday’s workout?",
        time: "9:30 AM",
        isMe: false,
      ),
      ChatModel(
        text: "Feeling great! A bit sore but in a good way 💪",
        time: "9:35 AM",
        isMe: true,
      ),
      ChatModel(
        text:
            "That’s what we like to hear! The soreness means you’re making progress.",
        time: "9:36 AM",
        isMe: false,
      ),
      ChatModel(
        text:
            "Thanks! Quick question about today’s workout - should I increase the weight?",
        time: "9:40 AM",
        isMe: true,
      ),
      ChatModel(
        text: "Great job on today’s workout! Keep it up.",
        time: "10:15 AM",
        isMe: false,
      ),
    ];
  }

  void sendMessage() {
    if (textController.text.trim().isEmpty) return;

    messages.add(
      ChatModel(text: textController.text.trim(), time: "Now", isMe: true),
    );

    textController.clear();
    
    // Unfocus to show mic icon again after sending
    Future.delayed(const Duration(milliseconds: 100), () {
      inputFocusNode.unfocus();
    });
  }

  @override
  void onClose() {
    inputFocusNode.dispose();
    textController.dispose();
    super.onClose();
  }
}