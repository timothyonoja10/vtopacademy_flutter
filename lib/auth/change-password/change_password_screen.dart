
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../schools/all-schools/schools_screen.dart';
import 'change_password_ui_state.dart';
import 'change_password_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangePasswordUiState(),
      child: ChangePassword(username: username),
    );
  }
}

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    var changePasswordUiState = context.watch<ChangePasswordUiState>();
    bool processing = changePasswordUiState.processing;
    bool passwordChanged = changePasswordUiState.passwordChanged;

    // Callback function for processing registration
    void processChangePasswordCallback(String newPassword, String code) {
      changePasswordUiState.processChangePasswordForm(username, newPassword, code);
    }

    // Navigate to SchoolsScreen if registered is true
    if (passwordChanged) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchoolsScreen()),
        )
      );
    }

    return ChangePasswordWidget(
      processing: processing,
      onChangePassword: processChangePasswordCallback,
    );
  }
}