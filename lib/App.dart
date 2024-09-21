import 'package:assignment_mod14_crud_app/Screens/ProductListScreen.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crud App",
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}
