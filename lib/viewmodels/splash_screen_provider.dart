import 'package:flutter/material.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    // init ค่าต่างๆ
    await Future.delayed(Duration(seconds: 1));
    _isInitialized = true;
    notifyListeners();
  }
}
