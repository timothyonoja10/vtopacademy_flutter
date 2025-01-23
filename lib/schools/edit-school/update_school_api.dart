
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../auth/authentication_store.dart';
import '../school.dart';

Future<bool> updateSchoolApi(School school) async {
  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  String schoolsUrl = '$baseUrl/schools';

  AuthenticationStore authenticationStore = AuthenticationStore();
  String accessToken = await authenticationStore.getAccessToken();
  if (accessToken == '') {
    print("Access token is missing");
    return false; 
  }
  
  final response = await http.patch(
    Uri.parse('$schoolsUrl/${school.schoolId}'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    },
    body: jsonEncode(school.toMap()),
  );
  
  if (response.statusCode != 200) {
    return false;
  }
  return true;
}