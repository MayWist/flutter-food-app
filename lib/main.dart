import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterappfood/routes/navigate.dart';
import 'package:flutterappfood/viewmodels/authentication.dart';
import 'package:flutterappfood/viewmodels/bottomnav_provider.dart';
import 'package:flutterappfood/viewmodels/food_viewmodel.dart';
import 'package:flutterappfood/viewmodels/map_viewmodel.dart';
import 'package:flutterappfood/viewmodels/splash_screen_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseSingleton().initialize;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
        ChangeNotifierProvider(create: (_) => MapViewModel()),
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) => FoodViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Food app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: Navigate.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: "/SplashScreenNav",
      ),
    );
  }
}
