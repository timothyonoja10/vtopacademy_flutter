
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../school.dart';

Future<List<School>> getAllSchoolsFromApi() async {
  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  String schoolsUrl = '$baseUrl/schools';
  
  final response = await http.get(Uri.parse(schoolsUrl));

  if (response.statusCode == 200) {
    final List<dynamic> schoolsJson = jsonDecode(response.body) as List<dynamic>;
    return schoolsJson.map((json) => School.fromJson(json as Map<String, dynamic>)).toList();
  } else {
    // throw Exception('Failed to load schools');
    return [];
  }
}