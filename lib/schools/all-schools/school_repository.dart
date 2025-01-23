
import 'package:vtopacademy_flutter/schools/all-schools/schools_api.dart';
import '../school.dart';
import 'schools_db.dart';

Future<List<School>> getAllSchools() async {

  List<School> schools = await getAllSchoolsFromApi();
  if (schools.isNotEmpty) {
    await updateAllSchoolsInDb(schools);
  }
  return await getAllSchoolsFromDb();
  
}