import 'package:flutter/material.dart';
import 'models/Produto.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({Key? key}) : super(key: key);
   @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final _formularioKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        backgroundColor: Colors.green
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _cadastroFormulario(),
            Expanded(child: _listaProdutos())
          ],
        ),
      ),
    );
  }

  Widget _cadastroFormulario() {
    return Form(
      key: _formularioKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome do produto';
                }
                return null;
              }
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _precoController,
              decoration: InputDecoration(
                labelText: 'Preço',
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o preço do produto.';
                }
                double? preco = double.tryParse(value);
                if (preco == null) {
                  return 'Preço inválido, digite apenas numéros.';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _cadastrarProduto,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text('Cadastrar'),
            ),
          ],
        )
      ),
    );
  }

  void _cadastrarProduto() {
    if (_formularioKey.currentState!.validate()) {
      Produto produto = Produto.withId(
        id: (Produto.Lista.length + 1),
        nome: _nomeController.text,
        preco: double.parse(_precoController.text),
      );
      setState(() {
        Produto.Lista.add(produto);
        _nomeController.clear();
        _precoController.clear();
      });
    }
  }

  Widget _listaProdutos() {
    return ListView.builder(
      itemCount: Produto.Lista.length,
      itemBuilder: (context, index) {
        final produto = Produto.Lista[index];
        
        return ListTile(
          title: Text('${produto.id} - ${produto.nome}'),
          subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
        );
      },
    );
  }
}