
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../auth/authentication_store.dart';

Future<bool> deleteSchool(int schoolId) async {
  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  String schoolsUrl = '$baseUrl/schools';

  AuthenticationStore authenticationStore = AuthenticationStore();
  String accessToken = await authenticationStore.getAccessToken();
  if (accessToken == '') {
    print("Access token is missing");
    return false; 
  }

  final response = await http.delete(
    Uri.parse('$schoolsUrl/$schoolId'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    },
  );

  if (response.statusCode != 200) {
    return false;
  }
  return true;
}