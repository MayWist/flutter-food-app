import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationViewModel extends ChangeNotifier {
  // FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  bool _login = false;

  bool get login => _login;

  set login(bool value) {
    _login = value;
  }

  Future<bool> emailandpasswordLogin(_email, _password) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: _email, password: _password);
      _login = true;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  Future<void> signOut(context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null &&
        user.providerData.any((element) => element.providerId == 'password')) {
      FirebaseAuth.instance.signOut();
    } else if (user != null &&
        user.providerData
            .any((element) => element.providerId == 'google.com')) {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      await googleSignIn.disconnect();
    }

    Navigator.pushNamedAndRemoveUntil(context, "/Home", (route) => false);
  }
}
