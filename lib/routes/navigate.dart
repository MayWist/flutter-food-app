import 'package:flutter/material.dart';
import 'package:flutterappfood/view/auth/account.dart';
import 'package:flutterappfood/view/auth/sign_in.dart';
import 'package:flutterappfood/view/basket.dart';
import 'package:flutterappfood/view/edit_map.dart';
import 'package:flutterappfood/view/food_delivery_location.dart';
import 'package:flutterappfood/view/home.dart';
import 'package:flutterappfood/view/notification_page.dart';
import 'package:flutterappfood/view/order.dart';

import '../view/bottomnavbar.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/Home': (BuildContext context) => Home(),
    '/Basket': (BuildContext context) => Basket(),
    '/Order': (BuildContext context) => Order(),
    '/Notification': (BuildContext context) => NotificationPage(),
    '/Account': (BuildContext context) => Account(),
    '/SignIn': (BuildContext context) => SignIn(),
    '/FoodDeliveryLocation': (BuildContext context) => FoodDeliveryLocation(),
    '/BottomNavBar': (BuildContext context) => BottomNavBar(),
    '/EditMap': (BuildContext context) => EditMap()
  };
}
