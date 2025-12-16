import 'package:flutter/material.dart';
import 'package:shalana07/features/home/child/model/post_model.dart';

class PostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onDelete;

  const PostTile({super.key, required this.post, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            if (post.title != null) ...[
              Text(
                post.title!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
            ],
            Text(post.content, style: const TextStyle(fontSize: 16)),
            if (post.description != null) ...[
              const SizedBox(height: 8),
              Text(
                post.description!,
                style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
              ),
            ],
            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: post.author.imageUrl != null
              ? NetworkImage(post.author.imageUrl!.trim())
              : null,
          radius: 24,
          child: post.author.imageUrl == null
              ? const Icon(Icons.person, size: 28)
              : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.author.displayName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                post.author.role,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
          tooltip: 'Delete Post',
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        const Icon(Icons.comment, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text('${post.commentsCount}'),
        const Spacer(),
        const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(post.createdAt.toLocal().toIso8601String().split('T')[0]),
      ],
    );
  }
}
