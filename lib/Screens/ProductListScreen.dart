import 'package:assignment_mod14_crud_app/Screens/Add_New_Product.dart';
import 'package:assignment_mod14_crud_app/Widget/ProductItem.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ProductItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16,);
            },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Add_New_Product();
            },));
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
