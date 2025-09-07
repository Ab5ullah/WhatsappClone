import 'package:flutter/material.dart';
import 'package:whatsapp/Onboarding/onboardingScreen2.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  @override
  Widget build(BuildContext context) {
    var screenHight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // centers horizontally
          children: [
            SizedBox(
              height: screenHight * .2,
            ),
            CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage("assets/img/onboarding.jpg")),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Welcome to WhatsApp",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Read our Privacy Policy. Tap “Agree and continue” to accept the Teams of Service.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  minimumSize: Size(screenWidth / 1.2, 40),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Onboardingscreen2(),
                      ));
                },
                child: Text("Agree and continue")),
          ],
        ),
      ),
    );
  }
}
