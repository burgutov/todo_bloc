import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_exports.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasksList.length} Pending : Completed ${state.completedTasks.length}',
                ),
              ),
            ),
            TasksList(tasksList: tasksList),
          ],
        );
      },
    );
  }
}
