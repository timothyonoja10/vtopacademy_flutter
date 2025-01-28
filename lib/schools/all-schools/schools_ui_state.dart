
import 'package:flutter/material.dart';
import '../../auth/authentication_store.dart';
import '../school.dart';
import 'school_repository.dart';

class SchoolsUiState extends ChangeNotifier {
  bool loading = true;
  bool isAdmin = false;
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
    AuthenticationStore authenticationStore = AuthenticationStore();
    isAdmin = await authenticationStore.isAdmin();
    notifyListeners();
  }
}