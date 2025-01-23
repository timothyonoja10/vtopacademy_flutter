
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vtopacademy_flutter/auth/auth_response.dart';

Future<AuthResponse> loginApi(String username, String password) async {
  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  String loginUrl = '$baseUrl/auth/login';

  final response = await http.post(
    Uri.parse(loginUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password
    })
  );

  if (response.statusCode != 201) {
    return AuthResponse(accessToken: '', isAdmin: false, isUser: false);
  }
  
  return AuthResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}