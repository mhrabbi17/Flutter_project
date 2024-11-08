import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/CancelledTaskScreen.dart';
import 'package:task_manager/ui/screens/NewTaskScreen.dart';
import 'package:task_manager/ui/screens/ProgressTaskScreen.dart';
import 'package:task_manager/ui/utils/AppColour.dart';
import 'package:task_manager/ui/widgets/tm_AppBar.dart';

import 'CompletedTaskScreen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;
  List<Widget> _screen = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int value) {
          _selectedIndex = value;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.new_label), label: "New"),
          NavigationDestination(
              icon: Icon(Icons.check_box), label: "Completed"),
          NavigationDestination(
              icon: Icon(Icons.stop_circle), label: "Cancelled"),
          NavigationDestination(icon: Icon(Icons.timeline), label: "Progress"),
        ],
      ),
    );
  }
}


