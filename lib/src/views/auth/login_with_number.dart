// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/utils/style/images/images.dart';
import '../../utils/style/color/colors.dart';
import 'login_with_number_viewmodel.dart';

class LoginWithNumber extends StatelessWidget {
  const LoginWithNumber({super.key});
  static String verifyId = '';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LoinWithNumberViewModel(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            body: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.whatsAppLogo,
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Phone Verification",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We need to register your phone without getting started!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    IntlPhoneField(
                      dropdownTextStyle:
                          TextStyle(color: AppColors.whiteColor, fontSize: 15),
                      dropdownIconPosition: IconPosition.trailing,
                      flagsButtonMargin: EdgeInsets.only(top: 5, left: 7),
                      keyboardType: TextInputType.phone,
                      invalidNumberMessage: '',
                      flagsButtonPadding: const EdgeInsets.only(bottom: 5),
                      textInputAction: TextInputAction.next,
                      dropdownIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.textColor,
                      ),
                      cursorColor: AppColors.black,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.whiteColor, width: 2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        hintText: 'Phone number',
                        hintStyle: TextStyle(color: AppColors.textColor),
                        filled: true,
                        fillColor: AppColors.appbarColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.whiteColor,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onChanged: (PhoneNumber? phoneNumber) {
                        viewmodel.phoneController = phoneNumber!.completeNumber;
                        print(phoneNumber);
                      },
                      initialCountryCode: 'PK',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.whiteColor,
                          backgroundColor: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: viewmodel.phoneController,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                LoginWithNumber.verifyId = verificationId;
                                viewmodel.navigateToVerificationView();
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {});
                                  
                        },
                        child: Text(
                          "Send the code",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
