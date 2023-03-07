import 'package:flutter/material.dart';
import 'package:flutterappfood/components/gridviewitem.dart';
import 'package:flutterappfood/model/choice_model.dart';
import 'package:flutterappfood/utility/constants.dart';
import 'package:flutterappfood/viewmodels/map_viewmodel.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _findrescontroller = TextEditingController();
  @override
  void dispose() {
    _findrescontroller.dispose();
    super.dispose();
  }

  Card image = Card(
    elevation: 5,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg',
        width: double.infinity,
        height: 180.0,
        fit: BoxFit.cover,
      ),
    ),
  );
  ListView listView = ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: CHOICE_OP.length,
    itemBuilder: (BuildContext context, int index) {
      List<Choice> item = CHOICE_OP;
      return SizedBox(
        width: 150.0,
        height: 100.0,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          elevation: 1,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(item[index].icon),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(item[index].text),
                )
              ]),
        ),
      );
    },
  );
  MyGridView gridView = MyGridView(
    items: DUMMYLISTMENU,
    itemHeight: 8.0,
  );
  @override
  Widget build(BuildContext context) {
    // Provider.of<MapViewModel>(context).getCurrentPosition();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 15.0,
        leading: const Icon(
          Icons.place,
          color: Colors.amber,
        ),
        title: Consumer(
          builder: (BuildContext context, MapViewModel map, Widget? child) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/FoodDeliveryLocation");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current location',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      map.currentLocationName,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      //search bar it have background color and color for border and thick lines in flutter

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _findrescontroller,
                        decoration: InputDecoration(
                          fillColor: Colors.amber,
                          filled: true,
                          suffixIcon: Icon(Icons.search),
                          suffixIconColor: Colors.white,
                          hintText: 'Find a restaurant now',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Colors.amber.shade300, width: 10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 1, 5, 2),
                  child: image),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                child: SizedBox(height: 100.0, child: listView),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Restaurant near me"),
              ),
              SizedBox(height: 400.0, child: gridView),
            ],
          ),
        ),
      ),
    );
  }
}
