
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<bool> forgotPasswordApi(String username, ) async {
  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  String forgotPasswordUrl = '$baseUrl/auth/forgot-password';

  final response = await http.post(
    Uri.parse(forgotPasswordUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username
    })
  );

  if (response.statusCode != 201) {
    return false;
  }
  
  return true;
}