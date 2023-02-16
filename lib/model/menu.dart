// ignore_for_file: public_member_api_docs, sort_constructors_first

class Menu {
  String img;
  String title;
  String category;
  double rating;
  Menu({
    required this.img,
    required this.title,
    required this.category,
    this.rating = 0.0,
  });
}
