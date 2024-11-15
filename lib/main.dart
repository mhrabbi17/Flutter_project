import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/counter_controller.dart';
import 'package:task_manager/home-screen.dart';
import 'package:task_manager/profile.dart';
import 'package:task_manager/settings-screen.dart';

void main(){
  runApp(const CounterApp());
}
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      initialRoute: '/',
      routes: {
        HomeScreen.name : (context) => HomeScreen(),
        ProfileScreen.name : (context) => ProfileScreen(),
        SettingsScreen.name : (context) => SettingsScreen(),
      },
    );
  }
}
class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(CounterController());
  }

}
