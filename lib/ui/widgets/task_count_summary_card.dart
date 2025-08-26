import 'package:flutter/material.dart';

class taskCountSummaryCard extends StatelessWidget {
  const taskCountSummaryCard({
    super.key, required this.title, required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("$count", style: Theme.of(context).textTheme.titleLarge,),
            Text(title, maxLines: 1,),
          ],
        ),
      ),
    );
  }
}