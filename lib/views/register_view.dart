import 'package:flutter/material.dart';
import '../controllers/register_controller.dart';
import 'otp_view.dart'; // Import the OTP screen

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create account! and shop on fingertips',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
              label: 'Username',
              onChanged: (value) => _registerController.setUsername(value),
            ),
            SizedBox(height: 10),
            _buildTextField(
              label: 'Email',
              onChanged: (value) => _registerController.setEmail(value),
            ),
            SizedBox(height: 10),
            _buildTextField(
              label: 'Password',
              obscureText: true,
              onChanged: (value) => _registerController.setPassword(value),
            ),
            SizedBox(height: 10),
            _buildTextField(
              label: 'Confirm password',
              obscureText: true,
              onChanged: (value) =>
                  _registerController.setConfirmPassword(value),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _registerController.isTermsAccepted,
                  builder: (context, isChecked, child) {
                    return Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        _registerController.toggleTermsAcceptance(value!);
                      },
                    );
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: 'I agree the ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ValueListenableBuilder<bool>(
              valueListenable: _registerController.isLoading,
              builder: (context, isLoading, child) {
                return ElevatedButton(
                  onPressed: () async {
                    await _registerController.register();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OTPVerificationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          'Agree and Register',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                );
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Divider(thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Or Login with'),
                ),
                Expanded(
                  child: Divider(thickness: 1),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton('assets/facebook.png'),
                _buildSocialButton('assets/google.png'),
                _buildSocialButton('assets/apple.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Custom TextField builder
  Widget _buildTextField({
    required String label,
    bool obscureText = false,
    required Function(String) onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }

  // Social button builder
  Widget _buildSocialButton(String asset) {
    return Container(
      width: 100,
      height: 50,
      child: Image.asset(asset, width: 24),
    );
  }
}
