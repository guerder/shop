import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final apiKey = env['API_KEY'];
    final _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$apiKey';
    final response = await http.post(
      _url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    print(json.decode(response.body));

    final responseBody = json.decode(response.body);
    if (responseBody["error"] != null) {
      throw AuthException(responseBody["error"]['message']);
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
