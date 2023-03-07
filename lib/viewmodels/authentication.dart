import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationViewModel extends ChangeNotifier {
  // FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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

  Future<bool> googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return false;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      _login = true;
      notifyListeners();
      return true;
    } catch (e) {
      print('Failed to sign in with Google: $e');
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
    _login = false;
    notifyListeners();
  }
}
