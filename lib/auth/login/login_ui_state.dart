

import 'package:flutter/material.dart';
import 'package:vtopacademy_flutter/auth/login/login_api.dart';
import '../auth_response.dart';
import '../authentication_store.dart';

class LoginUiState extends ChangeNotifier {

  bool processing = false;
  bool loggedIn = false;

  Future<void> processLoginForm(
    String username, String password
  ) async {
    processing = true;
    loggedIn = false;
    notifyListeners();

    AuthResponse authResponse = await loginApi(username, password);

    if (authResponse.accessToken.isEmpty) {
      // Registration failed
      processing = false;
      loggedIn = false;
    } 
    else {
      AuthenticationStore authenticationStore = AuthenticationStore();
      await authenticationStore.saveAuthInfo(
        authResponse.accessToken, authResponse.isAdmin, authResponse.isUser, 30
      );
      processing = false;
      loggedIn = true;
    }
    notifyListeners();
  } 
}