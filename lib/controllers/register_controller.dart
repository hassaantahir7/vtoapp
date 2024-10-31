import 'package:flutter/material.dart';

class RegisterController {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isTermsAccepted = ValueNotifier(false);
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  void setUsername(String value) {
    username = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void toggleTermsAcceptance(bool value) {
    isTermsAccepted.value = value;
  }

  Future<void> register() async {
    // Basic validation
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showError('All fields are required');
      return;
    }

    if (password != confirmPassword) {
      _showError('Passwords do not match');
      return;
    }

    isLoading.value = true; // Start loading state

    try {
      // Simulate a network call for registration (Replace this with your API call)
      await Future.delayed(Duration(seconds: 2));

      // Here you would typically send the registration data to your backend
      // For example: await AuthService.register(username, email, password);

      // If registration is successful, you might want to do additional actions here
      // For now, we'll just print a success message
      print('Registration successful for $username');

      // You can navigate to the next screen here if you want
      // e.g., Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
    } catch (error) {
      _showError('Registration failed. Please try again.');
    } finally {
      isLoading.value = false; // End loading state
    }
  }

  void _showError(String message) {
    // This function can be modified to show error messages in the UI
    print(message);
  }
}
