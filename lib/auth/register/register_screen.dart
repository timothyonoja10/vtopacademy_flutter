
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../schools/all-schools/schools_screen.dart';
import 'register_ui_state.dart';
import 'register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrationUiState(),
      child: Register(),
    );
  }
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var registrationUiState = context.watch<RegistrationUiState>();
    bool processing = registrationUiState.processing;
    bool registered = registrationUiState.registered;

    // Callback function for processing registration
    void processRegistrationCallback(String username, String password) {
      registrationUiState.processRegistrationForm(username, password);
    }

    // Navigate to SchoolsScreen if registered is true
    if (registered) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchoolsScreen()),
        )
      );
    }

    return RegisterWidget(
      processing: processing,
      onRegister: processRegistrationCallback,
    );
  }
}