import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/register_success_view.dart';
import '../controllers/otp_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OTPController()..startTimer(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<OTPController>(
            builder: (context, controller, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter the verification code we just sent on your email address.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              controller
                                  .updateOTP(controller.otpModel.otp + value);
                              if (index < 3) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      '00:${controller.otpModel.timer.toString().padLeft(2, '0')}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: controller.otpModel.timer == 0
                        ? controller.resendOTP
                        : null,
                    child: Text(
                      'Didn\'t receive code? Resend',
                      style: TextStyle(
                        color: controller.otpModel.timer == 0
                            ? Colors.black
                            : Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.otpModel.isOTPFilled
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterSuccessView()),
                            );
                          }
                        : null,
                    child: Text(
                      'Verify',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
