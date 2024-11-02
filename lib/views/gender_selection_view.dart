import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../assets/location_setting_view.dart';
import '../controllers/profile_onboarding_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'congratulations_view.dart';
import 'location.dart';

class GenderSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileOnboardingController(),
      child: Scaffold(
        body: Consumer<ProfileOnboardingController>(
          builder: (context, controller, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 55),
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE8ECF4)),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                      ),
                    ),
                  ),]),
                  SizedBox(height: 40),
                  Text(
                    'Select your Gender',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  _buildGenderOption(
                    context,
                    controller,
                    gender: "Men",
                    imagePath: "assets/men_image.svg",
                  ),
                  _buildGenderOption(
                    context,
                    controller,
                    gender: "Women",
                    imagePath: "assets/women_image.svg",
                  ),
                  _buildGenderOption(
                    context,
                    controller,
                    gender: "Kid",
                    imagePath: "assets/kid_image.svg",
                  ),
                  SizedBox(height: 130),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LocationSettingView()));
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGenderOption(BuildContext context,
      ProfileOnboardingController controller,
      {required String gender, required String imagePath}) {
    bool isSelected = controller.model.selectedGender == gender;

    return GestureDetector(
      onTap: () => controller.selectGender(gender),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.withOpacity(0.2),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent, // Make background transparent
            child: SvgPicture.asset(
              imagePath,
              width: 48, // Adjust size as needed
              height: 48,
            ),
          ),
          title: Text(gender),
          trailing: Radio<String>(
            value: gender,
            groupValue: controller.model.selectedGender,
            onChanged: (value) => controller.selectGender(value!),
          ),
        ),
      ),
    );
  }
}