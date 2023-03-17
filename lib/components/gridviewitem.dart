import 'package:flutter/material.dart';
import 'package:flutterappfood/model/food/store.dart';
import 'package:flutterappfood/viewmodels/food_viewmodel.dart';
import 'package:provider/provider.dart';

class MyGridView extends StatelessWidget {
  final List<Store> items;

  const MyGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 2;
    if (MediaQuery.of(context).size.width >= 600) {
      crossAxisCount = 3;
    }
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 3.5),
      itemBuilder: (context, index) {
        Store item = items[index];

        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/Store");
            context.read<FoodViewModel>().storeMenuId = item.id;
            context.read<FoodViewModel>().storeDetail = item;
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(children: [
                    Image.network(
                      item.imageUrl,
                      width: double.infinity,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.favorite_border_outlined)))
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 3, 15),
                  child: Text(item.name),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 3, 2),
                  child: Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.category),
                          Row(children: [
                            Image.network(
                              "https://affaso.com/wp-content/uploads/2020/06/5-point-stars-png-star-icon-flat-11562958768wpf63hu4tq.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            Text(item.rating.toString())
                          ])
                        ]),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
