import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/congratulations_view.dart';
import '../controllers/profile_onboarding_controller.dart';
import '../lib/controllers/profile_onboarding_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LocationSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileOnboardingController(),
      child: Scaffold(
        body: Consumer<ProfileOnboardingController>(
          builder: (context, controller, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
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
                  ),
                  ]),
                  SizedBox(height: 40),
                  Text(
                    'Set Your Location',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1E232C)
                    ),
                  ),
                  SizedBox(height: 80),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/location_ic.svg',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Your Location')
                    ],
                  ),
                  SizedBox(height: 200),
                  ElevatedButton(
                    onPressed: () {

                      controller.setLocation("User Location");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CongratulationsView()),
                      );
                    },
                    child: Text(
                      'Set Location',
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
}