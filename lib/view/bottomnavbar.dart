import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterappfood/utility/constants.dart';
import 'package:flutterappfood/view/auth/sign_in.dart';
import 'package:flutterappfood/viewmodels/authentication.dart';
import 'package:flutterappfood/viewmodels/bottomnav_provider.dart';
import 'package:provider/provider.dart';

import 'auth/account.dart';
import 'basket.dart';
import 'home.dart';
import 'notification_page.dart';
import 'order.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> _children = [
    Home(),
    Basket(),
    Order(),
    NotificationPage(),
    SignIn(),
  ];
  @override
  Widget build(BuildContext context) {
    BottomNavProvider provider_bottomnav =
        Provider.of<BottomNavProvider>(context, listen: true);
    AuthenticationViewModel provider_auth =
        Provider.of<AuthenticationViewModel>(context, listen: true);

    if (provider_auth.login) {
      _children[4] = Account();
      print("add acc");
    } else {
      _children[4] = SignIn();
      print("add SignIn");
    }
    return Scaffold(
      body: _children[provider_bottomnav.currentIndex],
      extendBody: true,
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder:
            (BuildContext context, BottomNavProvider bottomnav, Widget? child) {
          return CurvedNavigationBar(
            height: 60.0,
            items: ITEMBOTTOMNAV,
            color: Colors.amber,
            buttonBackgroundColor: Colors.amber,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              bottomnav.updateIndex(index);
            },
          );
        },
      ),
    );
  }
}
