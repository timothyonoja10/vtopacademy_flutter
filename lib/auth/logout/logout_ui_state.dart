
import 'package:flutter/material.dart';
import '../authentication_store.dart';

class LogoutUiState extends ChangeNotifier {

  bool loggedOut = false;

  Future<void> processLogout() async {
    AuthenticationStore authenticationStore = AuthenticationStore();
    loggedOut = await authenticationStore.deleteAuthInfo();
    
    notifyListeners();
  } 
  
}