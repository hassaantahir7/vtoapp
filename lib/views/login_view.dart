import 'package:flutter/material.dart';
import 'package:shop/views/forgot_password_view.dart';
import 'package:shop/views/gender_selection_view.dart';
import 'package:shop/views/register_view.dart';
import '../controllers/login_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:65,
                ),
                Text(
                  'Welcome back! \nGlad to see you, Again!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffDADADA)
                        )
                    ),
                  ),
                  onChanged: (value) {
                    _loginController.setEmail(value);
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    _loginController.setPassword(value);
                  },
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordView()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ValueListenableBuilder<bool>(
                  valueListenable: _loginController.isLoading,
                  builder: (context, isLoading, child) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                          _loginController.login();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenderSelectionView()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(330, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          backgroundColor: Color(0xff1E232C), // Button color
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : Text('Login',
                            style:
                            TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Divider(thickness: 1.6, color: Color(0xffE8ECF4),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or Login with'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Divider(thickness: 1.6, color: Color(0xffE8ECF4),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialButton('assets/facebook_ic.svg'),
                    _buildSocialButton('assets/google_ic.svg'),
                    _buildSocialButton('assets/apple.svg'),
                  ],
                ),
                SizedBox(height: 40,),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterView()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don’t have an account? ",
                        style: TextStyle(color: Color(0xff1E232C)),
                        children: [
                          TextSpan(
                            text: "Register Now",
                            style: TextStyle(
                                color: Color(0xff1E232C),
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String asset) {
    return Container(
      width: 95,
      height: 56,
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFDADADA)),
        borderRadius: BorderRadius.circular(8)
        // This might need to be adjusted based on your use case
      ),
      child: Center(
        child: SvgPicture.asset(asset, width: 25),
      ),
    );
  }
}