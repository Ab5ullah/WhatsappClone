import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Onboardingscreen2 extends StatefulWidget {
  const Onboardingscreen2({super.key});

  @override
  State<Onboardingscreen2> createState() => _Onboardingscreen2State();
}

class _Onboardingscreen2State extends State<Onboardingscreen2> {
  final TextEditingController phoneNumberController = TextEditingController();
  PhoneNumber _phone = PhoneNumber(isoCode: 'US');
  String countryCode = "";
  String? phoneNumberError;

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
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHight * .2,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Theme(
              data:
                  Theme.of(context).copyWith(colorScheme: ColorScheme.light()),
              child: InternationalPhoneNumberInput(
                spaceBetweenSelectorAndTextField: 0,
                onInputChanged: (PhoneNumber number) {
                  setState(() {
                    _phone = number;
                    phoneNumberController.text = number.phoneNumber ?? '';
                    countryCode = number.isoCode ?? 'US';
                  });
                },
                initialValue: _phone,
                inputDecoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
                searchBoxDecoration: InputDecoration(
                  labelText: 'Search Country',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'Type country name',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                ),
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                  useEmoji: true,
                ),
                formatInput: true,
                cursorColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
