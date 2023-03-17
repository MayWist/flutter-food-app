// class Menu {
//   String img;
//   String title;
//   String category;
//   double rating;
//   Menu({
//     required this.img,
//     required this.title,
//     required this.category,
//     this.rating = 0.0,
//   });
// }
// To parse this JSON data, do
//
//     final menuFood = menuFoodFromJson(jsonString);

import 'dart:convert';

List<MenuFood> menuFoodFromJson(String str) =>
    List<MenuFood>.from(json.decode(str).map((x) => MenuFood.fromJson(x)));

String menuFoodToJson(List<MenuFood> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuFood {
  MenuFood({
    required this.title,
    required this.price,
    required this.category,
    required this.rating,
    required this.imageUrl,
  });

  String title;
  double price;
  String category;
  double rating;
  String imageUrl;

  factory MenuFood.fromJson(Map<String, dynamic> json) => MenuFood(
        title: json["title"],
        price: json["price"]?.toDouble(),
        category: json["category"],
        rating: json["rating"]?.toDouble(),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "category": category,
        "rating": rating,
        "image_url": imageUrl,
      };
}
