import 'package:app/RegistrarPage.dart';
import 'package:flutter/material.dart'; 
import 'HomePage.dart'; 
import 'models/Login.dart'; 
 
class LoginPage extends StatefulWidget { 
  @override 
  _LoginPageState createState() => _LoginPageState(); 
} 
 
class _LoginPageState extends State<LoginPage> { 
  TextEditingController usernameController = TextEditingController(); 
  TextEditingController passwordController = TextEditingController(); 
  Login login = Login(); 
 
  void _validateUser() { 
    String username = usernameController.text; 
    String password = passwordController.text; 
 
    if (login.validaUsuario(username, password) == true) { 
      Navigator.pushReplacement( 
        context, 
        MaterialPageRoute(builder: (context) => HomePage()), 
      ); 
    } 
    else { 
      showDialog( 
        context: context, 
        builder: (context) => AlertDialog( 
          title: const Text('Usuário inválido'), 
          content: const Text('Por favor, insira um nome de usuário e senha válido.'), 
          actions: [ 
            TextButton( 
              child: const Text('OK'), 
              onPressed: () => Navigator.pop(context), 
            ) 
          ], 
        ), 
      ); 
    } 
  } 
 
  void _goToRegisterPage() { 
    Navigator.push( 
      context, 
      MaterialPageRoute(builder: (context) => Register()), 
    ); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Padding( 
        padding: EdgeInsets.all(16.0), 
        child: SingleChildScrollView( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [ 
              TextField( 
                controller: usernameController, 
                decoration: const InputDecoration( 
                  labelText: 'Usuário', 
                ), 
              ), 
              TextField( 
                controller: passwordController, 
                decoration: const InputDecoration( 
                  labelText: 'Senha', 
                ), 
                obscureText: true, 
              ), 
              SizedBox(height: 16.0), 
              ElevatedButton( 
                child: const Text('Login'), 
                onPressed: _validateUser, 
              ), 
              SizedBox(height: 16.0), 
              TextButton( 
                child: const Text(
                  'Não tem conta? Registrar',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: _goToRegisterPage, 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
}  