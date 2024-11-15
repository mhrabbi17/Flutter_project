import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:task_manager/counter_controller.dart';
import 'package:task_manager/profile.dart';
import 'package:task_manager/settings-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CounterController>(
                builder:(counterController) {
                  return Text(
                    '${counterController.counter}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                    ),);
                  },
              ),
              ElevatedButton(
                  onPressed: (){
                    //Get.to(()=>SettingsScreen(),transition: Transition.leftToRight);
                    Get.toNamed(SettingsScreen.name);
                  },
                  child: Text('Settings')
              ),
              ElevatedButton(
                  onPressed: (){
                    Get.showSnackbar(
                      GetSnackBar(
                        title: 'Home Page Alert!',
                        message: "This is Home Screen",
                        duration: Duration(seconds: 3),
                        snackPosition: SnackPosition.TOP,

                      )
                    );
                  },
                  child: Text('Snackbar Message')
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.find<CounterController>().increament();
            },
            child: const Icon(Icons.add),
        )
    );
  }
}
