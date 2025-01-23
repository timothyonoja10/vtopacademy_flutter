import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../change-password/change_password_screen.dart';
import 'forgot_password_ui_sate.dart';
import 'forgot_password_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordUiState(),
      child: ForgotPassword(),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var forgotPasswordUiState = context.watch<ForgotPasswordUiState>();
    bool processing = forgotPasswordUiState.processing;
    bool codeGenerated = forgotPasswordUiState.codeGenerated;
    String username = forgotPasswordUiState.username;

    // Callback function for processing registration
    void processForgotPasswordCallback(String username) {
      forgotPasswordUiState.processForgotPasswordForm(username);
    }

    // Navigate to SchoolsScreen if registered is true
    if (codeGenerated) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePasswordScreen(username: username)),
        )
      );
    }

    return ForgotPasswordWidget(
      processing: processing,
      onSubmit: processForgotPasswordCallback,
    );
  }
}