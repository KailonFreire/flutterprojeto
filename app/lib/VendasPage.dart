import 'package:flutter/material.dart';
import 'models/Venda.dart';
import 'models/Cliente.dart';
import 'models/Produto.dart';

class VendasPage extends StatefulWidget {
  @override
  _VendasPageState createState() => _VendasPageState();
}

class _VendasPageState extends State<VendasPage> {
  final _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vendas"),
        backgroundColor: Colors.green
      ),
      body: _listaVendas(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        hoverColor: Colors.greenAccent,
        onPressed: () {
          _cadastroModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _cadastroModal(BuildContext context) {
    final _produtoController = TextEditingController();
    final _clienteController = TextEditingController();
    final _quantidadeController = TextEditingController();

    showDialog (
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cadastrar Nova Venda"),
          content: SingleChildScrollView(
            child: Form(
              key: _formularioKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _produtoController,
                    decoration: const InputDecoration(
                      labelText: 'ID do Produto',
                      border: OutlineInputBorder() 
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o id do produto';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _clienteController,
                    decoration: const InputDecoration(
                      labelText: 'ID do Cliente',
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o id do cliente';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _quantidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Quantidade',
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a quantidade vendida';
                      }
                      return null;
                    }
                  )
                ],
              )
            )
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey)
              ),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                if(_formularioKey.currentState!.validate()) {
                  final novaVenda = Venda(
                    idProduto: int.parse(_produtoController.text),
                    idCliente: int.parse(_clienteController.text),
                    quantidade: int.parse(_quantidadeController.text)
                  );

                  setState(() {
                    Venda.Lista.add(novaVenda);
                    Navigator.pop(context);
                  });
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("O cadastro possui inconsitência."),
                      duration: Duration(seconds: 2)
                    )
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text("Cadastrar"),
            ),
          ],
        );
      },
    );
  }

  Widget _listaVendas() {
    return ListView.builder(
      itemCount: Venda.Lista.length,
      itemBuilder: (context, index) {
        final venda = Venda.Lista[index];
        final produto = Produto.Lista.firstWhere((p) => p.id == venda.idProduto);

        return ListTile(
          title: Text(produto.nome), // produoto
          subtitle: Text(Cliente.Lista.firstWhere((v) => v.id == venda.idCliente).nome), //cliente
          trailing: RichText(
            text: TextSpan(
              text: 'Total:',
              style: TextStyle(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: " R\$ ${(venda.quantidade * produto.preco).toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.normal)
                )
              ]
            )
          )
        );
      },
    );
  }
}