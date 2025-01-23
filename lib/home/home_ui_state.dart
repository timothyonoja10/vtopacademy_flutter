
import 'package:flutter/material.dart';
import '../auth/authentication_store.dart';

class HomeUiState extends ChangeNotifier {
  bool loading = true;
  bool loggedIn = false;

  HomeUiState() {
    _initialize();
  }

  Future<void> _initialize() async {
    await checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    AuthenticationStore authenticationStore = AuthenticationStore();
    loggedIn = await authenticationStore.hasAccessToken();
    loading = false;
    notifyListeners();
  }
}