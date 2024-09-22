import 'package:assignment_mod14_crud_app/Product/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DeleteProduct extends StatefulWidget {
  final Product product;
  const DeleteProduct({super.key, required this.product});

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  bool _inProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _inProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Product Code: ${widget.product.productCode}'),
                const SizedBox(
                  height: 16,
                ),
                Text('Price: \$${widget.product.unitPrice}'),
                const SizedBox(
                  height: 16,
                ),
                Text('Quantity: ${widget.product.quantity}'),
                const SizedBox(
                  height: 16,
                ),
                Text('Total Price: \$${widget.product.totalPrice}'),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(double.maxFinite),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () async {
                      bool confirm = await _confirmDelete(context);
                      if (confirm) {
                        await deleteProduct(widget.product.id);
                      }
                    },
                    child: const Text('Confirm Delete')),
              ]),
      ),
    );
  }

  Future<void> deleteProduct(String ProductId) async {
    setState(() {
      _inProgress = true;
    });
    Uri uri = Uri.parse(
        "http://164.68.107.70:6060/api/v1/DeleteProduct/${widget.product.id}");
    Response response = await get(uri);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product Deleted Successfully!"))
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to delete!")));
    }
    setState(() {
      _inProgress = false;
    });
  }
}

Future<bool> _confirmDelete(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Confirm Delete?"),
            content: Text("Are you sure you want to delete?"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Delete")),
            ],
          );
        },
      ) ??
      false;
}
