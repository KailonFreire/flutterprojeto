import 'package:flutter/material.dart';
import 'ClientesPage.dart';
import 'ProdutosPage.dart';
import 'VendasPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão'),
        backgroundColor: Colors.green
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gestão da Loja',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 120,              
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProdutosPage()),
                            );
                          },
                          icon: const Icon(
                            Icons.shopping_bag_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Produtos',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )  
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClientesPage()),
                            );
                          },
                          icon: const Icon(
                            Icons.people_alt_rounded,
                            size: 30,
                          ),
                        )
                      ),
                      const Center(
                        child: Text(
                          'Clientes',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VendasPage()),
                          );
                        },
                        icon: Icon(
                          Icons.attach_money_rounded,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Vendas',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}