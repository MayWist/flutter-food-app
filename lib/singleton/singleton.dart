import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseSingleton {
  static late FirebaseApp _app;

  FirebaseSingleton._internal();
  static final FirebaseSingleton _instance = FirebaseSingleton._internal();
  final _auth = FirebaseAuth.instance;

  factory FirebaseSingleton() => _instance;

  FirebaseAuth get auth => _auth;
}
