//API

import 'package:flutter/material.dart';
import 'package:flutterappfood/model/choice_model.dart';

import '../model/food/store.dart';

const SUCCESS = 200;
const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;

List<Choice> CHOICE_OP = [
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.mobile_off_outlined, text: "Shipping 0 B"),
  Choice(icon: Icons.dangerous, text: "Famous shop"),
  Choice(icon: Icons.sailing, text: "Special discount"),
];

List<Choice> DUMMULISTSETTING = [
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "000000000000"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "lorm"),
  Choice(icon: Icons.macro_off, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
];
List<Choice> DUMMYLISTSERVICE = [
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "XXXsadasd"),
  Choice(icon: Icons.abc, text: "wqeqweqew1010"),
];

List<Widget> ITEMBOTTOMNAV = [
  Icon(Icons.home, size: 30),
  Icon(Icons.shopping_basket, size: 30),
  Icon(Icons.list_alt, size: 30),
  Icon(Icons.notifications, size: 30),
  Icon(Icons.people_alt_sharp, size: 30),
];

List<String> DUMMYIMGSLIDER = [
  "https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_960_720.jpg",
  "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg",
  "https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994_960_720.jpg",
  "https://cdn.pixabay.com/photo/2014/04/22/02/56/pizza-329523_960_720.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_960_720.jpg"
];
Map<String, String> DUMMYFOOD = {
  '1': '''[
    {
      "title": "Burger",
      "price": 7.99,
      "category": "Sandwich",
      "rating": 4.3,
      "image_url": "https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_960_720.jpg"
    },
    {
      "title": "Pepperoni Pizza",
      "price": 9.99,
      "category": "Pizza",
      "rating": 4.6,
      "image_url": "https://cdn.pixabay.com/photo/2015/07/15/19/44/pizza-846841_960_720.jpg"
    },
    {
      "title": "Greek Salad",
      "price": 8.99,
      "category": "Salad",
      "rating": 4.7,
      "image_url": "https://cdn.pixabay.com/photo/2018/04/21/03/47/food-3337621_960_720.jpg"
    }
  ]''',
  '2': ''' [
    {
      "title": "Grilled Chicken Sandwich",
      "price": 6.99,
      "category": "Sandwich",
      "rating": 4.2,
      "image_url": "https://cdn.pixabay.com/photo/2016/02/11/22/14/wrap-1194729_960_720.jpg"
    },
    {
      "title": "Hawaiian Pizza",
      "price": 11.99,
      "category": "Pizza",
      "rating": 4.4,
      "image_url": "https://cdn.pixabay.com/photo/2020/08/19/14/43/pizza-5501075_960_720.jpg"
    },
    {
      "title": "Cobb Salad",
      "price": 9.99,
      "category": "Salad",
      "rating": 4.9,
      "image_url": "https://cdn.pixabay.com/photo/2017/09/10/16/37/cobb-salad-2736125_960_720.jpg"
    }
  ]''',
  '3': '''[
    {
      "title": "Turkey Club Sandwich",
      "price": 8.99,
      "category": "Sandwich",
      "rating": 4.1,
      "image_url": "https://cdn.pixabay.com/photo/2017/03/10/13/49/fast-food-2132863_960_720.jpg"
    },
    {
      "title": "Mushroom Pizza",
      "price": 10.99,
      "category": "Pizza",
      "rating": 4.3,
      "image_url": "https://cdn.pixabay.com/photo/2018/04/07/15/03/pizza-3298685_960_720.jpg"
    },
    {
      "title": "Caprese Salad",
      "price": 7.99,
      "category": "Salad",
      "rating": 4.5,
      "image_url": "https://cdn.pixabay.com/photo/2018/04/18/16/49/food-3330889_960_720.jpg"
    }
  ]'''
};
List<Store> DUMMYSTORE = [
  Store(
    id: "1",
    name: "PA Piz",
    category: "Grocery",
    rating: 4.5,
    imageUrl:
        "https://cdn.pixabay.com/photo/2020/04/01/19/36/showcase-4992402_960_720.jpg",
  ),
  Store(
    id: "2",
    name: "LA LA Tac",
    category: "นานาชาติ",
    rating: 4.2,
    imageUrl:
        "https://cdn.pixabay.com/photo/2016/11/29/10/09/bakery-1868925_960_720.jpg",
  ),
  Store(
    id: "3",
    name: "ลาซานย่าไทยแลน",
    category: "ไทย",
    rating: 4.8,
    imageUrl:
        "https://cdn.pixabay.com/photo/2017/08/06/13/59/store-2592761_960_720.jpg",
  ),
];
