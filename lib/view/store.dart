import 'package:flutter/material.dart';
import 'package:flutterappfood/model/food/menu_food.dart';
import 'package:provider/provider.dart';

import '../viewmodels/food_viewmodel.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    FoodViewModel provider = Provider.of<FoodViewModel>(context);
    context.read<FoodViewModel>().storeMenu();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.storeDetail.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(provider.storeDetail.rating.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Image.network(
                  provider.storeDetail.imageUrl,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: provider.menuFoods.length,
              itemBuilder: (context, index) {
                MenuFood item = provider.menuFoods[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/FoodDetail");
                      context.read<FoodViewModel>().fooditem = item;
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        item.imageUrl,
                        width: 100,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(item.title),
                    trailing: Text('\$${item.price}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
