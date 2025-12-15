import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/core/common/styles/global_text_style.dart';
import 'package:shalana07/core/utils/constants/colors.dart';
import 'package:shalana07/features/home/child/controllers/chat_controller.dart';
import 'package:shalana07/features/home/child/model/message_user_model.dart';
import 'package:shalana07/features/home/child/presentation/widgets/chat_bubble.dart';



class ChildChatScreen extends StatelessWidget {
  ChildChatScreen({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    final MessageUserModel? user = Get.arguments as MessageUserModel?;
    
    // If no user is passed, show error or return to previous screen
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: const Center(
          child: Text('No user data provided'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Row(
          children: [
            /// Profile circle
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white24,
              child: Text(
                user.initials,
                style: getTextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 12),

            /// Name & Status
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: getTextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Online",
                  style: getTextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Add video call functionality here
                  Get.snackbar(
                    'Coming Soon',
                    'Video call feature will be available soon!',
                    backgroundColor: AppColors.primary,
                    colorText: Colors.white,
                  );
                },
                child: const Icon(Icons.videocam_rounded, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// CHAT LIST
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  return ChatBubble(message: msg);
                },
              );
            }),
          ),

          /// INPUT BAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                /// TextField
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    focusNode: controller.inputFocusNode,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: getTextStyle(color: Colors.grey.shade500),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                Obx(() {
                  final hidden = controller.isInputFocused.value;
                  if (hidden) return const SizedBox(width: 8);
                  return Row(
                    children: [
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),
                          child: Icon(
                            Icons.mic,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  );
                }),

                /// Send button
                GestureDetector(
                  onTap: controller.sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}