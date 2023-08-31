import 'package:flutter/material.dart';
import 'package:phone_text_field/phone_text_field.dart';

class AddPhoneNumberPage extends StatelessWidget {
  const AddPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool phoneNumberFilled = false;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // upper portion
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Headline
                    Text(
                      'Enter your mobile number',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'To use UPI, please enter the mobile number linked to your bank account.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PhoneTextField(
                      locale: const Locale('en'),
                      decoration: const InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(),
                        ),
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone number",
                      ),
                      searchFieldInputDecoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(),
                        ),
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search country",
                      ),
                      initialCountryCode: "IN",
                      onChanged: (phone) {
                        debugPrint(phone.completeNumber);
                        if (phone.completeNumber.length == 13) {
                          phoneNumberFilled = true;
                        } else {
                          phoneNumberFilled = false;
                        }
                        debugPrint("$phoneNumberFilled");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'By proceeding, you are agreeing to the Terms & Conditions of EZPay',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // submit button
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'PROCEED',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: phoneNumberFilled
                            ? Colors.indigoAccent
                            : Colors.indigoAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // T&C
          ],
        ),
      ),
    );
  }
}
