
import 'package:flutter/material.dart';
import 'package:vtopacademy_flutter/auth/authentication_store.dart';
import 'package:vtopacademy_flutter/auth/register/register_api.dart';
import '../auth_response.dart';

class RegistrationUiState extends ChangeNotifier {
  bool processing = false;
  bool registered = false;

  Future<void> processRegistrationForm(
    String username, String password
  ) async {
    processing = true;
    registered = false;
    notifyListeners();

    AuthResponse authResponse = await registerApi(username, password);
    
    if (authResponse.accessToken.isEmpty) {
      // Registration failed
      processing = false;
      registered = false;
    } 
    else {
      AuthenticationStore authenticationStore = AuthenticationStore();
      await authenticationStore.saveAuthInfo(
        authResponse.accessToken, authResponse.isAdmin, authResponse.isUser, 30
      );
      processing = false;
      registered = true;
    }
    notifyListeners();
  }
}