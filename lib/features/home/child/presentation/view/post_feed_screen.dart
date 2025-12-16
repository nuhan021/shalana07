// screens/post_feed_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/home/child/controllers/post_controller.dart';
import 'package:shalana07/features/home/child/model/post_model.dart';
import 'package:shalana07/features/home/child/presentation/widgets/post_tile.dart';

class PostFeedScreen extends GetView<PostController> {
  const PostFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Feed')),
      body: Obx(() {
        if (controller.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error}'));
        }
        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return PostTile(post: post, onDelete: () => controller.deletePost(post.id));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreatePostDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreatePostDialog(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Post'),
        content: Padding( // 👈 Add padding around all content
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title Field
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Title (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 12), // 👈 Space between fields

              // Content Field
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: 'Content *',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                minLines: 2,
              ),
              const SizedBox(height: 12), // 👈 Space between fields

              // Description Field
              TextField(
                controller: descController,
                decoration: const InputDecoration(
                  hintText: 'Description (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                minLines: 2,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              controller.createPost(PostRequest(
                title: titleController.text.isEmpty ? null : titleController.text,
                content: contentController.text,
                description: descController.text.isEmpty ? null : descController.text,
              ));
              Navigator.pop(ctx);
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}