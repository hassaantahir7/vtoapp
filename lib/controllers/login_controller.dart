import 'package:flutter/material.dart';
import '../models/login_model.dart';

class LoginController {
  final LoginModel loginModel = LoginModel(email: '', password: '');
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  void login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Simulate a login delay
    isLoading.value = false;
    // Add logic here to handle actual login process
  }

  void setEmail(String email) {
    loginModel.email = email;
  }

  void setPassword(String password) {
    loginModel.password = password;
  }
}
