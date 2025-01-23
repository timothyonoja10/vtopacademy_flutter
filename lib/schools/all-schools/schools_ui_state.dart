
import 'package:flutter/material.dart';
import '../school.dart';
import 'school_repository.dart';

class SchoolsUiState extends ChangeNotifier {
  bool loading = true;
  List<School> schools = [];

  SchoolsUiState() {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadSchools();
  }

  Future<void> loadSchools() async {
    schools = await getAllSchools();
    loading = false;
    notifyListeners();
  }
}