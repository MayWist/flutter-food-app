import 'package:flutter/material.dart';
import 'package:flutterappfood/components/gridviewitem.dart';
import 'package:flutterappfood/utility/constants.dart';

class FoodDeliveryLocation extends StatelessWidget {
  FoodDeliveryLocation({super.key});
  MyGridView gridView = MyGridView(
    items: DUMMYLISTMENU,
    itemHeight: 8.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Food delivery location")),
        body: gridView
        // ListView.builder(
        //     itemCount: context.watch<MapViewModel>().textlist.length,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.blueAccent),
        //             borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        //         child: GoogleMapItem(
        //           latLng: context.watch<MapViewModel>().currentLocationLatLag,
        //         ),
        //       );
        //     }),
        );
  }
}
