import 'package:app/HomePage.dart';
import 'package:app/LoginPage.dart';
import 'package:flutter/material.dart';
import 'models/Login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailErrorText = '';
  String passwordErrorText = '';

  void _registerUser() {
    Login login = Login();
    String email = emailController.text;
    String password = passwordController.text;

    setState(() {
      emailErrorText = '';
      passwordErrorText = '';
    });

    if (email.length >= 3 && password.length >= 6) {
      login.addLogin(context, email, password);
      
      if (login.validaUsuario(email, password)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } 
    else {
      if (email.length < 3) {
        setState(() {
          emailErrorText = 'O e-mail precisa ter no mínimo 3 caracteres.';
        });
      }

      if (password.length < 6) {
        setState(() {
          passwordErrorText = 'A senha precisa ter no mínimo 6 caracteres.';
        });
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro ao registar'),
            content: Text(
                'Por favor entre um e-mail com no mínimo 3 caracteres e uma senha com pelo menos 6 caracteres.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Informe seu e-mail',
                errorText: emailErrorText.isEmpty ? null : emailErrorText,
                errorBorder: emailErrorText.isEmpty
                    ? null
                    : const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: emailErrorText.isEmpty ? Colors.blue : Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.length < 3) {
                  setState(() {
                    emailErrorText = 'E-mail precisa ter no mínimo 3 caracteres.';
                  });
                } else {
                  setState(() {
                    emailErrorText = '';
                  });
                }
              },
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Informe sua senha',
                errorText: passwordErrorText.isEmpty ? null : passwordErrorText,
                errorBorder: passwordErrorText.isEmpty
                    ? null
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: passwordErrorText.isEmpty ? Colors.blue : Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.length < 6) {
                  setState(() {
                    passwordErrorText = 'A senha precisa ter no mínimo 6 caracteres.';
                  });
                } else {
                  setState(() {
                    passwordErrorText = '';
                  });
                }
              },
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Registrar'),
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text(
                  'Já possui uma conta? Entrar',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}