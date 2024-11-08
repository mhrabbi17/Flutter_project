import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/TaskCard.dart';

class ProgressTaskScreen extends StatelessWidget {
  const ProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        //return TaskCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 8,
        );},
    );
  }
}
