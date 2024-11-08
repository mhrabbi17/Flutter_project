import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/SplashScreen.dart';
import 'package:task_manager/ui/utils/AppColour.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.navigatorkey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       colorSchemeSeed: AppColour.themecolor,
        textTheme: TextTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),

      ),
      home: SplashScreen(),
    );
  }

  InputDecorationTheme _inputDecorationTheme(){
    return InputDecorationTheme(
      fillColor: Colors.white,
      filled : true,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400
      ),
      border: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      errorBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
    );
  }

  OutlineInputBorder _outlineInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData(){
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColour.themecolor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12),
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
      ),
    );
  }
}
