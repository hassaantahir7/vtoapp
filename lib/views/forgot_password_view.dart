import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/otp_password_view.dart';
import 'package:shop/views/password_success_view.dart';
import '../controllers/forgot_password_controller.dart';
import 'login_view.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordController(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ForgotPasswordController>(
            builder: (context, controller, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Set Your Location',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Don't worry! It occurs. Please enter the email address linked with your account.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 60),
                    TextField(
                      onChanged: (value) => controller.updateEmail(value),
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        controller.sendCode();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPPasswordScreen()),
                        );
                      },
                      child: Text(
                        'Send Code',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Remember Password? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
