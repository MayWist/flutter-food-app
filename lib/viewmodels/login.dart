import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends ChangeNotifier {
  // FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  String _logintype = "";
  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  set email(String value) {
    _email = value;
  }

  set password(String value) {
    _password = value;
  }

  Future<void> anonymousLogin(context) async {
    try {
      _logintype = "anonymous";
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  Future<void> emailandpasswordLogin(context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInWithEmailAndPassword(
        email: _email, password: _password);
    _logintype = "email";
  }

  Future<void> signOut(context) async {
    switch (_logintype) {
      case "google":
        await FirebaseAuth.instance.signOut();
        await googleSignIn.disconnect();
        break;
      case "anonymous":
        await FirebaseAuth.instance.signOut();
        break;
      case "email":
        await FirebaseAuth.instance.signOut();
        break;
      default:
        await FirebaseAuth.instance.signOut();
    }
    Navigator.pushNamedAndRemoveUntil(context, "/Home", (route) => false);
  }
}
