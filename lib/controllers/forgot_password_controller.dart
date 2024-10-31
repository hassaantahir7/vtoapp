import 'package:flutter/material.dart';
import '../models/forgot_password_model.dart';

class ForgotPasswordController extends ChangeNotifier {
  final ForgotPasswordModel _forgotPasswordModel = ForgotPasswordModel();

  ForgotPasswordModel get forgotPasswordModel => _forgotPasswordModel;

  void updateEmail(String email) {
    _forgotPasswordModel.email = email;
    notifyListeners();
  }

  void sendCode() {
    if (_forgotPasswordModel.email.isNotEmpty) {
      print('Sending reset code to ${_forgotPasswordModel.email}');
    } else {
      print('Email cannot be empty');
    }
  }
}
