import 'package:flutter/material.dart';

class Add_New_Product extends StatefulWidget {
  const Add_New_Product({super.key});

  @override
  State<Add_New_Product> createState() => _Add_New_ProductState();
}

class _Add_New_ProductState extends State<Add_New_Product> {
  final TextEditingController _productNameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Prodcut"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildNewProductForm(),
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
            ),
            TextFormField(
              controller: _unitPriceTEController,
              decoration: InputDecoration(
                  hintText: 'Unit Price',
                  labelText: 'Unit Price'
              ),
            ),
            TextFormField(
              controller: _totalPriceTEController,
              decoration: InputDecoration(
                  hintText: 'Total Price',
                  labelText: 'Total Price'
              ),
            ),
            TextFormField(
              controller: _imageTEController,
              decoration: InputDecoration(
                  hintText: 'Image',
                  labelText: 'Image'
              ),
            ),
            TextFormField(
              controller: _codeTEController,
              decoration: InputDecoration(
                  hintText: 'Product Code',
                  labelText: 'Product Code'
              ),
            ),
            TextFormField(
              controller: _quantityTEController,
              decoration: InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Quantity'
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(double.maxFinite)
              ),
                onPressed: () {_onTapAddButton();}, child: const Text('Add Product')
            )
          ],
        ),
      );
  }
  void _onTapAddButton(){
  }
  @override
  void dispose() {
    _productNameTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();
    super.dispose();
  }
}
