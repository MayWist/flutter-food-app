//API

import 'package:flutter/material.dart';
import 'package:flutterappfood/model/choice_model.dart';
import 'package:flutterappfood/model/menu.dart';

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
List<Menu> DUMMYLISTMENU = [
  Menu(
      img:
          'https://krua.co/wp-content/uploads/2022/04/RT1717_ImageBanner_1140x507.jpg',
      title: 'ข้าวผัดปู',
      category: 'ไทย'),
  Menu(
      img:
          'https://upload.wikimedia.org/wikipedia/commons/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg',
      title: 'Tesoro Pizza',
      category: 'นานาชาติ'),
  Menu(
      img: '',
      title: 'Chicken Livers and Portuguese Roll',
      category: 'นานาชาติ'),
  Menu(
      img:
          'https://simply-delicious-food.com/wp-content/uploads/2016/11/easy-peri-peri-chicken-livers-2.jpg',
      title: 'Red Pepper Dip (V)',
      category: 'นานาชาติ'),
  Menu(
      img:
          'https://www.ajinomotofoodservicethailand.com/wp-content/uploads/2021/09/rd-1170x460.jpg',
      title: 'ยำรวมมิตรทะเล',
      category: 'ไทย'),
  Menu(
      img:
          'https://thejournalistclub.com/wp-content/uploads/2022/06/1-%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2-.jpeg',
      title: 'ราชากะเพรา',
      category: 'ไทย'),
];

List<Choice> DUMMULISTSETTING = [
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "000000000000"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "lorm"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
];
List<Choice> DUMMYLISTSERVICE = [
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
  Choice(icon: Icons.abc, text: "Give a discount"),
];
