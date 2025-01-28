
import 'package:flutter/material.dart';
import 'delete_school_api.dart';

class DeleteSchoolUiState extends ChangeNotifier {
  bool deleted = false;

  Future<void> processDeleteSchool(int schoolId) async {
    deleted = await deleteSchool(schoolId);
    notifyListeners();
  } 
}