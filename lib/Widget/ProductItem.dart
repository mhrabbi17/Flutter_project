import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Product Name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: CODE'),
          Text('Price: \$120'),
          Text('Quantity: 2'),
          Text('Total Price: \$240'),
          Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                  onPressed: (){},
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