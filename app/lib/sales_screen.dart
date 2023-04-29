import 'package:flutter/material.dart';
 class Sale {
  final String product;
  final String customerInfo;
  final int quantity;
  final double totalPrice;
   Sale({required this.product, required this.customerInfo, required this.quantity, required this.totalPrice});
}
 class SalesScreen extends StatefulWidget {
  @override
  _SalesScreenState createState() => _SalesScreenState();
}
 class _SalesScreenState extends State<SalesScreen> {
  final _salesList = <Sale>[];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales"),
      ),
      body: ListView.builder(
        itemCount: _salesList.length,
        itemBuilder: (context, index) {
          final sale = _salesList[index];
          return ListTile(
            title: Text(sale.product),
            subtitle: Text(sale.customerInfo),
            trailing: Text("\$${sale.totalPrice.toStringAsFixed(2)}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddSaleForm(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
   void _showAddSaleForm(BuildContext context) {
    final productController = TextEditingController();
    final customerController = TextEditingController();
    final quantityController = TextEditingController();
    final priceController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add new sale"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: productController,
                  decoration: InputDecoration(
                    labelText: "Product",
                  ),
                ),
                TextField(
                  controller: customerController,
                  decoration: InputDecoration(
                    labelText: "Customer info",
                  ),
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Quantity",
                  ),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Total price",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final product = productController.text;
                final customerInfo = customerController.text;
                final quantity = int.tryParse(quantityController.text ?? "") ?? 0;
                final price = double.tryParse(priceController.text ?? "") ?? 0;
                 if (product.isNotEmpty && customerInfo.isNotEmpty && quantity > 0 && price > 0) {
                  final sale = Sale(product: product, customerInfo: customerInfo, quantity: quantity, totalPrice: price);
                  setState(() {
                    _salesList.add(sale);
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter valid sale details."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}