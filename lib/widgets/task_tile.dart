import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_exports.dart';
import 'package:todo_bloc/widgets/popup_menu.dart';

import '../models/task.dart';
import '../screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  // ignore: unused_element
  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    print('EditTask');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(oldTask: task),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              task.isFavorite == false
                  ? const Icon(Icons.star_outline)
                  : const Icon(Icons.star),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null),
                    ),
                    Text(task.date),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TasksBloc>().add(UpdateTask(task: task));
                    }
                  : null,
              value: task.isDone,
            ),
            PopupMenu(
              task: task,
              cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
              likeOrDislike: () =>
                  context.read<TasksBloc>().add(FavoriteTask(task: task)),
              editTask: () {
                Navigator.of(context).pop();
                _editTask(context);
              },
              restoreTask: () =>
                  context.read<TasksBloc>().add(RestoreTask(task: task)),
            ),
          ],
        ),
      ],
    );
  }
}
