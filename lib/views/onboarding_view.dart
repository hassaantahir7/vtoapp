import 'package:flutter/material.dart';
import '../controllers/onboarding_controller.dart';
import '../models/onboarding_model.dart';
import 'login_view.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingController _controller = OnboardingController();
  PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> pages = _controller.getOnboardingPages();


    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [

          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildOnboardingPage(
                  pages[index], screenHeight, screenWidth);
            },
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pages.length, (index) {
                      if (_currentIndex == index) {

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(
                            'assets/active_dot.png',
                            width: screenWidth * 0.08,
                            height: screenWidth * 0.08,
                          ),
                        );
                      } else {

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: screenWidth * 0.02,
                          height: screenWidth * 0.02,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        );
                      }
                    }),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_currentIndex == pages.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.06,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: screenWidth * 0.05,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: screenWidth * 0.25,
            child: Container(
              width: screenWidth * 0.50,
              height: screenHeight * 0.008,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(
      OnboardingModel page, double screenHeight, double screenWidth) {
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(page.imageAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Add gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.7),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Existing text content
          Positioned(
            bottom: screenHeight * 0.165,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  page.title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  page.description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }}