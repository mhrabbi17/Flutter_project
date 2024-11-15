import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String name = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Back')
            ),
            ElevatedButton(
                onPressed: () {
                  Get.off(() => ProfileScreen(),transition: Transition.leftToRight);
                },
                child: Text('Profile')
            ),
          ],
        ),
      ),
    );
  }
}
