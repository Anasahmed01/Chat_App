// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';
import 'package:whatsapp/src/utils/style/images/images.dart';
import 'package:whatsapp/src/views/auth/login_with_number.dart';
import 'package:whatsapp/src/views/auth/verification/verification_viewmodel.dart';

import '../../../services/snackbar_services.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => VerificationViewModel(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                ),
              ),
              elevation: 0,
            ),
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
                    Pinput(
                      length: 6,
                      showCursor: true,
                      onChanged: (value) {
                        viewmodel.code = value;
                      },
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
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () async {
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: LoginWithNumber.verifyId,
                                      smsCode: viewmodel.code);
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);
                              viewmodel.navigateToHomeView();
                              ShowSnackBarService.showSnackbar(
                                  '', 'Login successful!');
                            } catch (e) {
                              ShowSnackBarService.showSnackbar(
                                  '', 'Invalid OTP!');
                            }
                          },
                          child: Text("Verify Phone Number")),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            viewmodel.navigateToLoginView();
                          },
                          child: Text(
                            "Edit Phone Number ?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
