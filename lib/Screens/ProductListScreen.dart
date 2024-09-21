import 'dart:convert';

import 'package:assignment_mod14_crud_app/Product/product.dart';
import 'package:assignment_mod14_crud_app/Screens/Add_New_Product.dart';
import 'package:assignment_mod14_crud_app/Widget/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList =[];
  bool _inProgress = false;
  @override
  void initState() {
    super.initState();
    getProductList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
              onPressed: () {getProductList();},
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: _inProgress? const Center(
        child: CircularProgressIndicator(),
      ): Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: productList[index],
              );
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
  Future<void> getProductList() async{

    _inProgress = true;
    print('Requesting');
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/ReadProduct");
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      productList.clear();
      Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']){
        Product product = Product(
          id: item['_id'] ?? '', // Use default if null
          productName: item['ProductName'] ?? '', // Default value
          productCode: item['ProductCode'] ?? '',
          productImage: item['Img'] ?? '',
          unitPrice: item['UnitPrice'] ?? '',
          quantity: item['Qty'] ?? '',
          totalPrice: item['TotalPrice'] ?? '',
          createdAt: item['CreatedDate'] ?? '',);
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }
}
