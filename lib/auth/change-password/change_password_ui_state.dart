

import 'package:flutter/material.dart';
import '../auth_response.dart';
import '../authentication_store.dart';
import 'change_password_api.dart';

class ChangePasswordUiState extends ChangeNotifier {

  bool processing = false;
  bool passwordChanged = false;

  Future<void> processChangePasswordForm(
    String username, String newPassword, String code
  ) async {
    processing = true;
    passwordChanged = false;
    notifyListeners();

    AuthResponse authResponse = await changePasswordApi(username, newPassword, code);

    if (authResponse.accessToken.isEmpty) {
      // Registration failed
      processing = false;
      passwordChanged = false;
    } 
    else {
      AuthenticationStore authenticationStore = AuthenticationStore();
      await authenticationStore.saveAuthInfo(
        authResponse.accessToken, authResponse.isAdmin, authResponse.isUser, 30
      );
      processing = false;
      passwordChanged = true;
    }
    notifyListeners();
  } 
}