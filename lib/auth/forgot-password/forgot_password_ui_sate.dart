
import 'package:flutter/material.dart';

import 'forgot_password_api.dart';

class ForgotPasswordUiState extends ChangeNotifier {
  bool processing = false;
  bool codeGenerated = false;
  String username = "";

  Future<void> processForgotPasswordForm(
    String usernameInput
  ) async {
    processing = true;
    codeGenerated = false;
    notifyListeners();

    codeGenerated = await forgotPasswordApi(usernameInput);
    username = usernameInput;
    processing = false;
    notifyListeners();
  }
}