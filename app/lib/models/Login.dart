import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:password_hash_plus/password_hash_plus.dart';

class Login{
  late int id;
  late String email;
  late String senha;
  late int nivel_acesso;

  static Map<String, String>  usuarios = new HashMap();  
  
  void addLogin(BuildContext context, String email, String senha) {
    if (usuarios.containsKey(email)) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('E-mail já existe'),
          content: Text('$email já foi registrado.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } 
    else {
      usuarios[email] = _hashSenha(senha);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Sucesso'),
          content: const Text('Conta registrada com sucesso.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  String _hashSenha(String senha) {
    PBKDF2 generator = new PBKDF2();
    String salt = Salt.generateAsBase64String(6);
    List<int> hash = generator.generateKey(senha, salt, 1000, 24);
    String hashBase64 = base64Encode(hash);
    return '$salt:$hashBase64';
  }

  static bool verificaSenha(String senha, String hashArmazenado) {
    PBKDF2 generator = new PBKDF2();
    List<String> hashParts = hashArmazenado.split(':');
    List<int> hashCalculado = generator.generateKey(senha, hashParts[0], 1000, 24);
    String hashEncoded = base64Encode(hashCalculado);
    return hashParts[1] == hashEncoded;
  }

  bool validaUsuario(String email, String senha) {
    print(usuarios);
    return usuarios.containsKey(email) && verificaSenha(senha, usuarios[email]!);
  }
}