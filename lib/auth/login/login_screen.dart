
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../schools/all-schools/schools_screen.dart';
import 'login_ui_state.dart';
import 'login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginUiState(),
      child: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var loginUiState = context.watch<LoginUiState>();
    bool processing = loginUiState.processing;
    bool loggedIn = loginUiState.loggedIn;

    void processLoginCallback(String username, String password) {
      loginUiState.processLoginForm(username, password);
    }

    if (loggedIn) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchoolsScreen()),
        )
      );
    }

    return LoginWidget(
      processing: processing,
      onLogin: processLoginCallback,
    );
  }
}