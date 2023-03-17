import 'package:flutter/material.dart';
import 'package:flutterappfood/model/food/order_food.dart';
import 'package:provider/provider.dart';

import '../viewmodels/food_viewmodel.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: Text("Basket")),
      body: Consumer<FoodViewModel>(
        builder: (context, FoodViewModel provider, child) {
          return ListView.builder(
              itemCount: provider.orderfood.length,
              itemBuilder: (context, index) {
                OrderFood itme = provider.orderfood[index];
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/FoodDetail");
                    provider.index_edit = index;
                    provider.is_edit = true;
                    print(context.watch<FoodViewModel>().indexSize);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  isThreeLine: true,
                  title: Text(itme.food.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Size: ${itme.size}"),
                      Text("Amount: ${itme.amount}"),
                      Text("Comments: ${itme.comments}"),
                      Text("\$${itme.food.price * itme.amount!}")
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      provider.removeOrderFood(itme);
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
