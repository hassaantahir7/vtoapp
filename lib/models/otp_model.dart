class OTPModel {
  String otp = '';
  int timer = 60; // initial countdown time in seconds

  bool get isOTPFilled => otp.length == 4;
}
