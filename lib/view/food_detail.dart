import 'package:flutter/material.dart';
import 'package:flutterappfood/viewmodels/food_viewmodel.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../model/food/order_food.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  late TextEditingController _comments;

  @override
  void initState() {
    super.initState();
    _comments = TextEditingController();
  }

  @override
  void dispose() {
    _comments.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<FoodViewModel>(
          builder: (context, FoodViewModel provider, child) {
            late String text;
            if (provider.is_edit) {
              text = provider.orderfood[provider.index_edit].food.title;
            } else {
              text = provider.fooditem.title;
            }
            return Text(text);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Consumer<FoodViewModel>(
                  builder: (context, FoodViewModel provider, child) {
                    late String url;

                    if (provider.is_edit) {
                      url =
                          provider.orderfood[provider.index_edit].food.imageUrl;
                    } else {
                      url = provider.fooditem.imageUrl;
                    }
                    return Image.network(
                      url,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Consumer<FoodViewModel>(
                  builder: (context, FoodViewModel provider, child) {
                    late String foodtitle;
                    late double price;
                    late int amount;
                    if (provider.is_edit) {
                      foodtitle =
                          provider.orderfood[provider.index_edit].food.title;
                      price =
                          provider.orderfood[provider.index_edit].food.price;
                      amount = provider.orderfood[provider.index_edit].amount!;
                    } else {
                      foodtitle = provider.fooditem.title;
                      price = provider.fooditem.price;
                      amount = provider.amount;
                    }
                    return ListTile(
                        title: Text(
                          foodtitle,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              price.toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text("${amount * price}")
                          ],
                        ));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Amount:'),
              Consumer<FoodViewModel>(
                builder: (context, FoodViewModel order, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: order.amount > 0
                            ? () {
                                order.setAmount(order.amount - 1);
                              }
                            : null,
                        disabledColor: Colors.grey.withOpacity(0.5),
                      ),
                      Text("${order.amount}"),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          order.setAmount(order.amount + 1);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Consumer<FoodViewModel>(
            builder: (context, provider, child) {
              return GroupButton(
                buttons: [
                  FoodSize.small.value,
                  FoodSize.medium.value,
                  FoodSize.large.value
                ],
                isRadio: true,
                selectedButton: context.watch<FoodViewModel>().indexSize,
                options: GroupButtonOptions(
                  spacing: 10,
                  selectedTextStyle: TextStyle(color: Colors.white),
                  selectedColor: Colors.blue,
                  unselectedTextStyle: TextStyle(color: Colors.black),
                  unselectedColor: Colors.grey[300],
                ),
                onSelected: (int index, bool isSelected) {
                  context.read<FoodViewModel>().foodSize =
                      FoodSize.values[index].value;
                  context.read<FoodViewModel>().indexSize = index;
                },
              );
            },
          ),
          Consumer<FoodViewModel>(
            builder: (context, FoodViewModel provider, child) {
              return ElevatedButton(
                  onPressed: provider.amount > 0
                      ? () {
                          if (provider.is_edit) {
                            provider.editItem(
                                amount: provider.amount,
                                size: provider.foodSize,
                                comments: _comments.text);

                            provider.is_edit = false;
                          } else {
                            OrderFood orderfood = OrderFood(
                              id: provider.storeMenuId +
                                  provider.fooditem.title,
                              food: provider.fooditem,
                              amount: provider.amount,
                              size: provider.foodSize,
                              comments: _comments.text,
                            );
                            provider.addOrderFood(orderfood);
                          }
                          provider.selectItem(
                              provider.storeMenuId + provider.fooditem.title);
                          Navigator.pop(context);
                        }
                      : null,
                  child: Text("เพิ่มไปยังตะกร้า"));
            },
          ),
          Consumer<FoodViewModel>(
            builder: (context, FoodViewModel provider, child) {
              if (provider.is_edit) {
                _comments.text = provider.comments;
              }
              return TextField(
                controller: _comments,
                decoration: const InputDecoration(labelText: 'Add comments'),
              );
            },
          ),
        ],
      ),
    );
  }
}
