import 'package:flutter/material.dart';
import 'package:flutterappfood/model/food/store.dart';
import 'package:flutterappfood/utility/constants.dart';

import '../model/food/menu_food.dart';
import '../model/food/order_food.dart';

class FoodViewModel extends ChangeNotifier {
  List<OrderFood> _orderfood = [];
  List<MenuFood> _menuFoods = [];
  late MenuFood _fooditem;
  bool _is_edit = false;
  String _comments = "";
  late String _foodSize;
  int _indexSize = 0;

  int get indexSize => _indexSize;

  set indexSize(int value) {
    _indexSize = value;
  }

  String get foodSize => _foodSize;

  set foodSize(String value) {
    _foodSize = value;
  }

  String get comments => _comments;

  set comments(String value) {
    _comments = value;
  }

  bool get is_edit => _is_edit;

  set is_edit(bool value) {
    _is_edit = value;
    if (_is_edit) {
      _amount = _orderfood[_index_edit].amount!;
      _comments = _orderfood[_index_edit].comments!;
      _foodSize = _orderfood[_index_edit].size!;
    } else {
      _amount = 0;
    }
  }

  late int _index_edit;

  int get index_edit => _index_edit;

  set index_edit(int value) {
    _index_edit = value;
  }

  int _amount = 0;
  String _selectedItem = '';
  String get selectedItem => _selectedItem;

  void setAmount(int newAmount) {
    _amount = newAmount;
    notifyListeners();
  }

  void selectItem(String item) {
    if (_selectedItem != item) {
      _selectedItem = item;
      _amount = 0; // reset the amount to 0 when a new item is selected
      notifyListeners();
    }
  }

  int get amount => _amount;

  late OrderFood _orderFood;

  OrderFood get orderFood => _orderFood;

  set orderFood(OrderFood value) {
    _orderFood = value;
  }

  MenuFood get fooditem => _fooditem;

  set fooditem(MenuFood value) {
    _fooditem = value;
  }

  late Store _storeDetail;

  Store get storeDetail => _storeDetail;

  set storeDetail(Store value) {
    _storeDetail = value;
  }

  List<MenuFood> get menuFoods => _menuFoods;

  List<OrderFood> get orderfood => _orderfood;
  late String _storeMenuId;

  String get storeMenuId => _storeMenuId;

  set storeMenuId(String value) {
    _storeMenuId = value;
  }

  void storeMenu() {
    _menuFoods = menuFoodFromJson(DUMMYFOOD[_storeMenuId]!);
  }

  void addOrderFood(OrderFood orderfood) {
    _orderfood.add(orderfood);
    notifyListeners();
  }

  void removeOrderFood(OrderFood orderfood) {
    _orderfood.remove(orderfood);
    notifyListeners();
  }

  void editItem({int? amount, String? size, String? comments}) {
    if (amount != null) _orderfood[_index_edit].amount = amount;
    if (size != null) _orderfood[_index_edit].size = size;
    if (comments != null) _orderfood[_index_edit].comments = comments;
    notifyListeners();
  }
}
