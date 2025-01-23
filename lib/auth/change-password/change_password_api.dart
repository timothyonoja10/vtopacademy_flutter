
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../auth_response.dart';
import '../authentication_store.dart';

Future<AuthResponse> changePasswordApi(
  String username, String newPassword, String code
) async {
  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  String changePasswordUrl = '$baseUrl/auth/change-password';
  
  AuthenticationStore authenticationStore = AuthenticationStore();
  String accessToken = await authenticationStore.getAccessToken();
  if (accessToken == '') {
    print("Access token is missing");
    return AuthResponse(accessToken: '', isAdmin: false, isUser: false); 
  }
    
  final response = await http.post(
    Uri.parse(changePasswordUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'newPassword': newPassword,
      'code': code,
    }),
  );

  if (response.statusCode != 201) {
    return AuthResponse(accessToken: '', isAdmin: false, isUser: false);
  }
  
  return AuthResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}