import 'package:flutter/material.dart';
 class Product {
  final int id;
  final String name;
  final double price;
   Product({required this.id, required this.name, required this.price});
}
 class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);
   @override
  _ProductsScreenState createState() => _ProductsScreenState();
}
 class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];
   TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Product Price',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addProduct();
              },
              child: Text('Add Product'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index].name),
                    subtitle: Text('\$${products[index].price}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
   void addProduct() {
    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty) {
      Product product = Product(
        id: products.length,
        name: _nameController.text,
        price: double.parse(_priceController.text),
      );
      setState(() {
        products.add(product);
        _nameController.clear();
        _priceController.clear();
      });
    }
  }
}