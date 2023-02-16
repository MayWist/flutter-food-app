import 'package:flutter/material.dart';
import 'package:flutterappfood/model/menu.dart';

class MyGridView extends StatelessWidget {
  final List<Menu> items;
  final double itemHeight;

  const MyGridView({super.key, required this.items, required this.itemHeight});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Calculate the number of cross-axis cells based on the screen size
    // final crossAxisCount = (screenSize.width / itemHeight).floor();
    // childAspectRatio: 2 / screenSize.width,

    // var crossAxisCount = MediaQuery.of(context).size.aspectRatio > 1 ? 2 : 3;
    int crossAxisCount = 2;
    if (MediaQuery.of(context).size.width >= 600) {
      crossAxisCount = 3;
    }
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 15,
          crossAxisSpacing: 30,
          childAspectRatio: 2 / 3),
      itemBuilder: (context, index) {
        return Card(
            child: Column(children: [
          Expanded(
              flex: 3,
              child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("...")]))),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(color: Colors.blue[900]),
                  child: Center(child: Text("...fsdfdsfsdfds"))))
        ]));
        // return GridTile(
        //     header: SizedBox(
        //       height: 20,
        //       child: Card(
        //         color: Colors.white30,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(6.0),
        //         ),
        //         elevation: 1,
        //       ),
        //     ),
        //     child: SizedBox(
        //       height: 20,
        //       child: Card(
        //         color: Colors.green,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(6.0),
        //         ),
        //         elevation: 1,
        //       ),
        //     ));
      },
    );
  }
}
