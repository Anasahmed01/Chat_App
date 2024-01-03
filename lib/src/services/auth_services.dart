import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // signIn User in

  Future signInWithPhoneNumber(String phoneNumber) async {
    try {
      UserCredential userCredential = (await _firebaseAuth
          .signInWithPhoneNumber(phoneNumber)) as UserCredential;

// after creating user, creating a new document for the user in the user collection.

      _firebaseFirestore.collection('/').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,

        "phoneNumber":
            phoneNumber, //your data which will be added to the collection and collection will be created after this
      }).then((_) {
        print("collection created");
      }).catchError((_) {
        print("an error occured");
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
