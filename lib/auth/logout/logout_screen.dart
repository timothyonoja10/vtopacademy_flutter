
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../schools/all-schools/schools_screen.dart';
import 'logout_ui_state.dart';
import 'logout_widget.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogoutUiState(),
      child: Logout(),
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    var logoutUiState = context.watch<LogoutUiState>();
    bool loggedOut = logoutUiState.loggedOut;

    // Callback function for processing registration
    void processLogoutCallback() {
      logoutUiState.processLogout();
    }

    // Navigate to SchoolsScreen if registered is true
    if (loggedOut) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchoolsScreen()),
        )
      );
    }

    return LogoutWidget(
      loggedOut: loggedOut,
      onLogout: processLogoutCallback,
    );
  }
}