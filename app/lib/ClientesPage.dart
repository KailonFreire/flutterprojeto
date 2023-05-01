import 'package:flutter/material.dart';
// import 'customer.dart';
import 'models/Cliente.dart';

class ClientesPage extends StatefulWidget {
  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  final _formularioKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        backgroundColor: Colors.green
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _cadastroFormulario(),
            Expanded(child: _listaClientes()),
          ],
        )
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
              decoration:const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome do cliente';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o email do cliente';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _enderecoController,
              decoration: const InputDecoration(
                labelText: 'Endereço',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o endereço do cliente';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _cadastrarCliente,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listaClientes() {
    return ListView.builder(
      itemCount: Cliente.Lista.length,
      itemBuilder: (context, index) {
        final cliente = Cliente.Lista[index];

        return ListTile(
          title: Text("${cliente.id} - ${cliente.nome}"),
          subtitle: Text(cliente.email),
          trailing: Text(cliente.endereco),
        );
      },
    );
  }

  void _cadastrarCliente() {
    if (_formularioKey.currentState!.validate()) {
      final novoCliente = Cliente.withId(
        id: (Cliente.Lista.length + 1),
        nome: _nomeController.text,
        email: _emailController.text,
        endereco: _enderecoController.text,
      );
      setState(() {
        Cliente.Lista.add(novoCliente);
        _nomeController.clear();
        _emailController.clear();
        _enderecoController.clear();
      });
    }
  }
}