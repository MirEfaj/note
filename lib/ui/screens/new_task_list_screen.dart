import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/task_card.dart';
import '../widgets/task_count_summary_card.dart';
import 'add_new_task_screen.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return taskCountSummaryCard(title: 'Progress', count: 12);
                }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10);
              },),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TaskCard(taskType: TaskType.tNew,);
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTaskButton, child: Icon(Icons.add),),
    );
  }

  void _addNewTaskButton() { Get.toNamed(AddNewTaskScreen.name);}

}


