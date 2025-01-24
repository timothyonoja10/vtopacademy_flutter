
import 'package:flutter/material.dart';
import '../school.dart';
import 'save_school_api.dart';

class AddSchoolUiState extends ChangeNotifier {

  bool processing = false;
  bool schoolAdded = false;

  Future<void> processAddSchoolForm(String name, int number) async {
    processing = true;
    schoolAdded = false;
    notifyListeners();

    School newSchool = School(schoolId: 0, name: name, number: number);
    schoolAdded = await saveSchoolApi(newSchool);
    processing = false;
    notifyListeners();
  } 
}