import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController messageController = TextEditingController();
  User? user;

  Future<void> getUser() async {
    user = auth.currentUser;
    if (user == null) {
      // If the user is not signed in, sign in anonymously
      UserCredential userCredential = await auth.signInAnonymously();
      user = userCredential.user;
    }
  }

  Future<void> sendMessage(String text) async {
    await firestore.collection('messages').add({
      'text': text,
      'sender': user!.uid,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
