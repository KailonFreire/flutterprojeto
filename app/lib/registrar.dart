import 'package:app/HomePage.dart';
import 'package:app/LoginPage.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
 class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
 class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Login login = Login();
  String emailErrorText = '';
  String passwordErrorText = '';

   void _registerUser() {
    String email = emailController.text;
    String password = passwordController.text;
     setState(() {
      emailErrorText = '';
      passwordErrorText = '';
    });
     if (email.length >= 3 && password.length >= 6) {
      login.addLogin(context, email, password);
      if (login.validaUsuario(email, password)) {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomePage()),
        // );
      }
    } else {
      if (email.length < 3) {
        setState(() {
          emailErrorText = 'Email should have at least 3 characters.';
        });
      }
      if (password.length < 6) {
        setState(() {
          passwordErrorText = 'Password should have at least 6 characters.';
        });
      }
       showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid registration'),
            content: Text(
                'Please enter a valid email with at least 3 characters and a valid password with at least 6 characters.'),
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
        title: const Text('Register'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
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
                    emailErrorText = 'Email should have at least 3 characters.';
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
                hintText: 'Enter your password',
                errorText: passwordErrorText.isEmpty ? null : passwordErrorText,
                errorBorder: passwordErrorText.isEmpty
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
                    passwordErrorText = 'Password should have at least 6 characters.';
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
              child: Text('Register'),
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
                  'Already have an account? Log in now!',
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