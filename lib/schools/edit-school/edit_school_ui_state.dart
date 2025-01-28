
import 'package:flutter/material.dart';
import '../school.dart';
import 'update_school_api.dart';

class EditSchoolUiState extends ChangeNotifier {

  bool processing = false;
  bool schoolUpdated = false;

  Future<void> processEditSchoolForm(
    int schoolId, String name, int number
  ) async {
    processing = true;
    schoolUpdated = false;
    notifyListeners();

    School school = School(schoolId: schoolId, name: name, number: number);
    schoolUpdated = await updateSchoolApi(school);
    notifyListeners();
  } 
}