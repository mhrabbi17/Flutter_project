import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/home-screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String name = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.back(

                  );
                },
                child: Text('Back')
            ),
            ElevatedButton(
                onPressed: () {
                  //Get.to(()=>Profile());
                  Get.offAll(()=> HomeScreen(),
                    opaque: false,
                    transition: Transition.leftToRight,
                  );
                },
                child: Text('Home')
            ),
          ],
        ),
      ),
    );
  }
}
