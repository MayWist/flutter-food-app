import 'package:flutter/material.dart';
import 'package:flutterappfood/routes/navigate.dart';
import 'package:flutterappfood/viewmodels/bottomnav_provider.dart';
import 'package:flutterappfood/viewmodels/login.dart';
import 'package:flutterappfood/viewmodels/map_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => MapViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Food app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: Navigate.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: "/BottomNavBar",
      ),
    );
  }
}
