// screens/post_feed_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shalana07/features/home/child/controllers/post_controller.dart';
import 'package:shalana07/features/home/child/model/post_model.dart';

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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(hintText: 'Title (optional)')),
            TextField(controller: contentController, decoration: const InputDecoration(hintText: 'Content *')),
            TextField(controller: descController, decoration: const InputDecoration(hintText: 'Description (optional)')),
          ],
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

class PostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onDelete;

  const PostTile({super.key, required this.post, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (post.author.imageUrl != null)
                  CircleAvatar(
                    backgroundImage: NetworkImage(post.author.imageUrl!.trim()), // trim trailing spaces
                    radius: 20,
                  )
                else
                  const CircleAvatar(child: Icon(Icons.person), radius: 20),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.author.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(post.author.role, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (post.title != null) Text(post.title!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(post.content),
            if (post.description != null) ...[
              const SizedBox(height: 4),
              Text(post.description!, style: const TextStyle(color: Colors.grey)),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                Text('${post.commentsCount} comments'),
                const Spacer(),
                Text(post.createdAt.toLocal().toIso8601String().split('T')[0]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}