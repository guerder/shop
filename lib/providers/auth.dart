import 'dart:convert';
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final apiKey = env['API_KEY'];
    final _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$apiKey';
=======

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=';

  Future<void> signup(String email, String password) async {
>>>>>>> 05d84f2c7fe847b3b6ffd24d62f5e104a51298cb
    final response = await http.post(
      _url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
<<<<<<< HEAD
=======

>>>>>>> 05d84f2c7fe847b3b6ffd24d62f5e104a51298cb
    print(json.decode(response.body));

    return Future.value();
  }
<<<<<<< HEAD

  Future<void> signup(String email, String password) {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) {
    return _authenticate(email, password, 'signInWithPassword');
  }
=======
>>>>>>> 05d84f2c7fe847b3b6ffd24d62f5e104a51298cb
}
