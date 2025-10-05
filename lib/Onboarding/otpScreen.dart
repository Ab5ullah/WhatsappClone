import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  @override
  Widget build(BuildContext context) {
    var screenHight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Verifying your number",
          style: TextStyle(
            fontSize: 18,
            color: Colors.green[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "Waiting to automatically detect an SMS sent to ",
                children: [
                  TextSpan(
                    text: "+923144123912. ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "Wrong number?",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 4),
              child: Center(
                child: SizedBox(
                  width: 230,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6), // six digit OTP
                    ],
                    style: const TextStyle(
                      letterSpacing: 10, // spacing between digits
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      hintText: "------",
                      hintStyle: TextStyle(
                        fontSize: 28,
                        letterSpacing: 10,
                        color: Colors.grey,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter 6-digit code",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Didn't receive code?",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
