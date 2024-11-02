import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_view.dart';

class CongratulationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    ),]),

                  SizedBox(
                    width: 150,
                    height: 30,
                  ),
                 Container(
                   height: 162,
                   width: 172,
                   child:  CircleAvatar(
                     backgroundColor: Colors.transparent, // Make background transparent
                     child: SvgPicture.asset(
                       'assets/congratulatins.svg',
                       width: 172, // Adjust size as needed
                       height: 162,
                     ),
                   ),
                 )

           ,
              SizedBox(height: 20),
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1E232C)
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You are ready to go.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1E232C),
                ),
              ),
              SizedBox(height: 130),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
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
        ),
      ),
    );
  }
}
