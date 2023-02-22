import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  int _currentIndex = 0;
  void updateIndex(BuildContext context, int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;
}
