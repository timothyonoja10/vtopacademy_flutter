
import 'package:vtopacademy_flutter/schools/all-schools/schools_api.dart';
import 'package:vtopacademy_flutter/utitlities/supports_offline_storage.dart';
import '../school.dart';
import 'schools_db.dart';

Future<List<School>> getAllSchools() async {
  
  List<School> schools = await getAllSchoolsFromApi();

  if (!supportsOfflineStorage()) {
    return schools;
  }

  if (schools.isNotEmpty) {
    await updateAllSchoolsInDb(schools);
  }
  return await getAllSchoolsFromDb();
  
}