import 'package:flutter/material.dart';
import 'package:todo_bloc/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        children: tasksList
            .map(
              (task) => ExpansionPanelRadio(
                value: task.id,
                headerBuilder: (context, isOpen) => TaskTile(task: task),
                body: ListTile(
                  title: SelectableText.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Text\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: task.title.toString(),
                        ),
                        const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: task.description.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
// Expanded(
//       child: ListView.builder(
//           itemCount: tasksList.length,
//           itemBuilder: (context, index) {
//             var task = tasksList[index];
//             return TaskTile(task: task);
//           }),
//     );