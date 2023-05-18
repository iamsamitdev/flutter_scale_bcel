import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      onSkip: () {
        debugPrint("On Skip Called....");
        Navigator.pushNamed(context, '/login');
      },
      showPrevNextButton: true,
      showIndicator: true,
      backgourndColor: icons,
      activeDotColor: primary,
      deactiveDotColor: divider,
      iconColor: primaryText,
      leftIcon: Icons.arrow_circle_left_rounded,
      rightIcon: Icons.arrow_circle_right_rounded,
      iconSize: 30,
      pages: [
        OnBoardingModel(
          image: Image.asset("assets/images/Feed-bro.png"),
          title: "Business Chat",
          body:
              "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start",
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/Feedback-bro.png"),
          title: "Coffee With Friends",
          body:
              "When your morning starts with a cup of coffee and you are used to survive the day with the same, then all your Instagram stories and snapchat streaks would stay filled up with coffee pictures",
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/Credit-card-pana.png"),
          title: "Mobile Application",
          body:
              "Mobile content marketing has also been found to enhance quick online actions and make follow-ups easier.",
        ),
        OnBoardingModel(
          image: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/Health-passport-pana.png"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: icons),
                  ),
                ),
              ],
            ),
          ),
          title: "",
          body: "",
        ),
      ],
    );
  }
}
