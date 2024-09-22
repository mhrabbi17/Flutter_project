import 'dart:convert';

import 'package:assignment_mod14_crud_app/Product/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Update_Product extends StatefulWidget {
  final Product product;
  const Update_Product({super.key, required this.product});


  @override
  State<Update_Product> createState() => _Update_ProductState();
}

class _Update_ProductState extends State<Update_Product> {
  final TextEditingController _productNameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    _productNameTEController.text = widget.product.productName;
    _unitPriceTEController.text= widget.product.unitPrice;
    _totalPriceTEController.text = widget.product.totalPrice;
    _imageTEController.text = widget.product.productImage;
    _codeTEController.text = widget.product.productCode;
    _quantityTEController.text = widget.product.quantity;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Prodcut"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildNewProductForm(),
        ),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: InputDecoration(
                hintText: 'Name',
                labelText: 'Product Name'
            ),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return "Enter a valid value";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEController,
            decoration: InputDecoration(
                hintText: 'Product Code',
                labelText: 'Product Code'
            ),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return "Enter a valid value";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: InputDecoration(
                hintText: 'Quantity',
                labelText: 'Quantity'
            ),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return "Enter a valid value";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: InputDecoration(
                hintText: 'Unit Price',
                labelText: 'Unit Price'
            ),
            validator: (String? value){
              if(value == null || value!.isEmpty){
                return "Enter a valid value";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: InputDecoration(
                hintText: 'Total Price',
                labelText: 'Total Price'
            ),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return "Enter a valid value";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEController,
            decoration: InputDecoration(
                hintText: 'Image',
                labelText: 'Image'
            ),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return "Enter a valid value";
              }
              return null;
            },
          ),
          const SizedBox(height: 16,),
          _inProgress?Center(
            child: CircularProgressIndicator(),
          ): ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite)
              ),
              onPressed: () {_onTapAddButton();}, child: const Text('Update')
          )
        ],
      ),
    );
  }
  void _onTapAddButton(){
    if(_formKey.currentState!.validate()){
      updateProduct();
    }
  }
  Future<void> updateProduct()async{
    _inProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text,
      "ProductCode":_codeTEController.text,
      "ProductName":_productNameTEController.text,
      "Qty":_quantityTEController.text,
      "TotalPrice":_totalPriceTEController.text,
      "UnitPrice":_unitPriceTEController.text,
    };
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.product.id}");
    Response response = await post(uri,
        headers: {
          "Content-Type": "application/json"
        },
        body:jsonEncode(requestBody)
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      clearTextField();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Successfully Updated!")));
    }
    _inProgress = false;
    setState(() {});
  }
  void clearTextField(){
    _productNameTEController.clear();
    _codeTEController.clear();
    _quantityTEController.clear();
    _unitPriceTEController.clear();
    _totalPriceTEController.clear();
    _imageTEController.clear();
  }
  @override
  void dispose() {
    _productNameTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
