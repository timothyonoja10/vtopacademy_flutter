
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_ui_state.dart';
import 'home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeUiState(),
      child: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var mainUiState = context.watch<HomeUiState>();
    bool loading = mainUiState.loading;     
    bool loggedIn = mainUiState.loggedIn;   

    return HomeWidget(loading: loading, loggedIn: loggedIn);
  }
}
