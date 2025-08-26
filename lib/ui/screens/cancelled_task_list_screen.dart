import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_summary_card.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() => _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TaskCard(taskType: TaskType.cancelled,);
                    }))
          ],
        ),
      );
  }

  void _addNewTaskButton() {}

}


