import '../models/onboarding_model.dart';

class OnboardingController {
  List<OnboardingModel> getOnboardingPages() {
    return [
      OnboardingModel(
        imageAsset: 'assets/onboarding1.png',
        title: 'Your style tell about you',
        description:
            'There are many clothes with designs that are suitable for you today',
      ),
      OnboardingModel(
        imageAsset: 'assets/onboarding2.png',
        title: 'Level up your lifestyle',
        description:
            'There are many clothes with designs that are suitable for you today',
      ),
      OnboardingModel(
        imageAsset: 'assets/onboarding3.png',
        title: 'Level up your lifestyle',
        description:
            'There are many clothes with designs that are suitable for you today',
      ),
    ];
  }
}
