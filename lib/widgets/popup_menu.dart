import 'package:flutter/material.dart';

import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTask;
  final VoidCallback restoreTask;

  const PopupMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislike,
    required this.editTask,
    required this.restoreTask,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) {
                return [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () => editTask(),
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () => likeOrDislike(),
                    child: TextButton.icon(
                      onPressed: null,
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add)
                          : const Icon(Icons.bookmark_remove),
                      label: task.isFavorite == false
                          ? const Text('Add to Bookmarks')
                          : const Text('Remove from Bookmarks'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Remove'),
                    ),
                    onTap: () => cancelOrDeleteCallback(),
                  ),
                ];
              }
            : (context) {
                return [
                  PopupMenuItem(
                    onTap: () => restoreTask(),
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore),
                      label: const Text('Restore'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete'),
                    ),
                    onTap: () => cancelOrDeleteCallback(),
                  ),
                ];
              });
  }
}
