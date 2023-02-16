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
  @override
  void initState() {
    super.initState();
  }

  TextField find_res = TextField();
  Image image = Image.network(
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-menu-promotion-design-template-29de117a2c0d6dba80ccd0970fca1f5b_screen.jpg?ts=1620243830',
      height: 250,
      width: 250,
      fit: BoxFit.cover);
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
          color: Colors.white30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          elevation: 1,
          child: Column(
              children: [Icon(item[index].icon), Text(item[index].text)]),
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
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/FoodDeliveryLocation");
            },
            icon: const Icon(Icons.map),
          ),
          title: Consumer(
            builder: (BuildContext context, MapViewModel map, Widget? child) {
              // return Text(map.currentLocationName);
              // TextButton.icon(
              //   icon: null,
              //   label: null,
              //   onPressed: () {},
              // );
              return InkWell(
                child: Text(map.currentLocationName),
                onTap: () {
                  Navigator.pushNamed(context, "/FoodDeliveryLocation");
                },
              );
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Find res',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 100.0, child: listView),
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
