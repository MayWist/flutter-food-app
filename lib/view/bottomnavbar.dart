import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterappfood/utility/constants.dart';
import 'package:flutterappfood/viewmodels/bottomnav_provider.dart';
import 'package:provider/provider.dart';

import 'auth/sign_in.dart';
import 'basket.dart';
import 'home.dart';
import 'notification_page.dart';
import 'order.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    Home(),
    Basket(),
    Order(),
    NotificationPage(),
    SignIn()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavProvider>(context);

    return Scaffold(extendBody: true,
      body: _children[provider.currentIndex],
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (BuildContext context, bottomnav, Widget? child) {
          return CurvedNavigationBar(
            height: 60.0,
            items: ITEMBOTTOMNAV,
            color: Colors.amber,
            buttonBackgroundColor: Colors.amber,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              bottomnav.updateIndex(context, index);
            },
          );
        },
      ),
    );
  }
}
