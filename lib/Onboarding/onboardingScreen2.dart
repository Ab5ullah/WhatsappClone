import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp/Onboarding/otpScreen.dart';

class Onboardingscreen2 extends StatefulWidget {
  const Onboardingscreen2({super.key});

  @override
  State<Onboardingscreen2> createState() => _Onboardingscreen2State();
}

class _Onboardingscreen2State extends State<Onboardingscreen2> {
  String countryName = "United States";
  String dialCode = "+1";
  final TextEditingController phoneNumberController = TextEditingController();

  void _selectCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true, // shows +92 etc
      onSelect: (Country country) {
        setState(() {
          countryName = country.displayNameNoCountryCode; // Full country name
          dialCode = "+${country.phoneCode}";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Enter your phone number",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: "WhatsApp will need to verify your account. ",
                      children: [
                        TextSpan(
                          text: "What's my number?",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ])),
              const SizedBox(height: 10),

              // Country Name Selector
              GestureDetector(
                onTap: _selectCountry,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        countryName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Country Code + Phone Number on one line with underline
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        dialCode,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "Enter your phone number",
                            border: InputBorder.none, // no inner underline
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Text(
                "Carrier Charger may apply",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Otpscreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Text("Next"))
            ],
          ),
        ));
  }
}
