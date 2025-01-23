
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../auth/authentication_store.dart';
import '../school.dart';

Future<bool> saveSchoolApi(School school) async {
  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  String schoolsUrl = '$baseUrl/schools';
  
  AuthenticationStore authenticationStore = AuthenticationStore();
  String accessToken = await authenticationStore.getAccessToken();
  if (accessToken == '') {
    print("Access token is missing");
    return false; 
  }
    
  final response = await http.post(
    Uri.parse(schoolsUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    },
    body: jsonEncode(school.toMap()),
  );

  if (response.statusCode != 201) {
    return false;
  }
  
  return true;
}