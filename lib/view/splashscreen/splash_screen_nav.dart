import 'package:flutter/material.dart';
import 'package:flutterappfood/view/bottomnavbar.dart';
import 'package:flutterappfood/view/splashscreen/splash_screen.dart';
import 'package:flutterappfood/viewmodels/splash_screen_provider.dart';
import 'package:provider/provider.dart';

class SplashScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenProvider>(
      builder: (context, provider, child) {
        if (provider.isInitialized) {
          return BottomNavBar();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
