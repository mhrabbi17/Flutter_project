import 'package:assignment_mod14_crud_app/Product/product.dart';
import 'package:assignment_mod14_crud_app/Screens/UpdateScreen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Price: \$${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price: \$${product.totalPrice}'),
          Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Update_Product(product: product,);
                        },));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Edit')
              ),
              TextButton.icon(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,),
                  label: const Text('Delete')
              ),
            ],
          )
        ],
      ),
    );
  }
}