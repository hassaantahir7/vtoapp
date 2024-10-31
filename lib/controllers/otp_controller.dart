import 'dart:async';
import 'package:flutter/material.dart';
import '../models/otp_model.dart';

class OTPController extends ChangeNotifier {
  OTPModel _otpModel = OTPModel();
  Timer? _timer;

  OTPModel get otpModel => _otpModel;

  void startTimer() {
    _otpModel.timer = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_otpModel.timer > 0) {
        _otpModel.timer--;
        notifyListeners();
      } else {
        _timer?.cancel();
      }
    });
  }

  void updateOTP(String value) {
    _otpModel.otp = value;
    notifyListeners();
  }

  void resendOTP() {
    // Logic to resend OTP goes here
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
