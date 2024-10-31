import 'package:flutter/material.dart';
import '../models/profile_onboarding_model.dart';

class ProfileOnboardingController extends ChangeNotifier {
  final ProfileOnboardingModel _model = ProfileOnboardingModel();

  ProfileOnboardingModel get model => _model;

  void selectGender(String gender) {
    _model.selectedGender = gender;
    notifyListeners();
  }

  void setLocation(String location) {
    _model.location = location;
    notifyListeners();
  }
}
