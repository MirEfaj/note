import 'package:flutter/material.dart';

enum TaskType {tNew, progress, completed, cancelled}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.taskType,
  });

  final TaskType taskType;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title will be here",style: Theme.of(context).textTheme.titleLarge,),
            Text('description will be here'),
            Text("Date : 12/5/2025"),
            SizedBox(height: 5,),
            Row(
              children: [
                Chip(label: Text(_getTaskTypeName(), style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide.none,
                  ),
                  backgroundColor: _getTaskChipColor(),
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color _getTaskChipColor(){
    switch(taskType){
      case TaskType.tNew :
        return Colors.blue;
      case TaskType.progress :
        return Colors.purpleAccent;
      case TaskType.completed :
        return Colors.cyan;
      case TaskType.cancelled:
        return Colors.red;
    }
  }

  String _getTaskTypeName(){
    switch(taskType){
      case TaskType.tNew :
        return "New";
      case TaskType.progress :
        return "Progress";
      case TaskType.completed :
        return "Completed";
      case TaskType.cancelled:
        return "Cancelled";
    }
  }


}