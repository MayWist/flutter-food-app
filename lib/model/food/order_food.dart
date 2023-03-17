// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'menu_food.dart';

class OrderFood {
  String id;
  MenuFood food;
  int? amount;
  String? size;
  String? comments;

  OrderFood({
    required this.id,
    required this.food,
    this.amount,
    this.size,
    this.comments,
  });
}

enum FoodSize {
  small,
  medium,
  large,
}

extension FoodSizeExtension on FoodSize {
  String get value {
    switch (this) {
      case FoodSize.small:
        return 'Small';
      case FoodSize.medium:
        return 'Medium';
      case FoodSize.large:
        return 'Large';
    }
  }
}
