import 'package:flutter/material.dart';
import 'package:tm/ui/screens/new_task_list_screen.dart';
import 'package:tm/ui/screens/progress_task_list_screen.dart';
import '../widgets/tm_app_bar.dart';
import 'cancelled_task_list_screen.dart';
import 'completed_task_list_screen.dart';

class MainNavBarHolderScreen extends StatefulWidget {
  const MainNavBarHolderScreen({super.key});

  static const String name = "/Main-nav-bar";

  @override
  State<MainNavBarHolderScreen> createState() => _MainNavBarHolderScreenState();
}

class _MainNavBarHolderScreenState extends State<MainNavBarHolderScreen> {
  final List<Widget> _screens =[
    NewTaskListScreen(),
    ProgressTaskListScreen(),
    CompletedTaskListScreen(),
    CancelledTaskListScreen()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.new_label_outlined), label: "New"),
          NavigationDestination(icon: Icon(Icons.update), label: "Progress"),
          NavigationDestination(icon: Icon(Icons.done), label: "Completed"),
          NavigationDestination(icon: Icon(Icons.cancel_outlined), label: "Cancelled"),
        ],
          ),
    );
  }
}


