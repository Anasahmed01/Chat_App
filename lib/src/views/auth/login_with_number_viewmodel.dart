import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp/src/views/auth/verification/verification.dart';
import '../../app/app.locator.dart';
import '../../services/auth_services.dart';
import '../../services/snackbar_services.dart';

class LoinWithNumberViewModel extends BaseViewModel {
  //TextEditingController phoneNumberControler = TextEditingController();
  navigateToVerificationView() {
    locator<NavigationService>().replaceWithTransition(
      const Verification(),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }

  String phoneController = '';

  var user = locator<AuthServices>();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInWithPhoneNumber(String phoneNumber) async {
    try {
      UserCredential userCredential = (await _firebaseAuth
          .signInWithPhoneNumber(phoneNumber)) as UserCredential;
      print('userCredential>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$userCredential');

// after creating user, creating a new document for the user in the user collection.

      await _firebaseFirestore
          .collection('/')
          .doc(userCredential.user!.uid)
          .collection('${userCredential.user!.phoneNumber}');
      print(
          '_firebaseFirestore>>>>>>>>>>>>>>>>>>>>>>>>>>>>$_firebaseFirestore');

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  void signIn() async {
    try {
      await user.signInWithPhoneNumber(phoneController);
      notifyListeners();
    } catch (e) {
      print('Your Sigin Error>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$e');
      ShowSnackBarService.showSnackbar(
          '', 'Your Sigin Error>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$e');
    }
  }
}
