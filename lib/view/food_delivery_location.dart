import 'package:flutter/material.dart';
import 'package:flutterappfood/components/googlemap.dart';
import 'package:flutterappfood/viewmodels/map_viewmodel.dart';
import 'package:provider/provider.dart';

class FoodDeliveryLocation extends StatelessWidget {
  FoodDeliveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    MapViewModel provider = Provider.of<MapViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Food delivery location")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: provider.textlist.length,
            itemBuilder: (context, index) {
              IconData icon = provider.icondata[index];
              String title = provider.textlist[index];
              late Widget map;
              if (index == 0) {
                map = Column(
                  children: [
                     ListTile(
                      title: Text(title),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0))),
                      child: GoogleMapItem(
                        latLng: provider.currentLocationLatLag,
                        edit: false,
                      ),
                    )
                  ],
                );
              } else {
                map = Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(icon),
                      title: Text(title),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          provider.selectedLatLng =
                              await provider.latLanlist[index];
                          provider.selectedindex = index;
                          Navigator.pushNamed(context, "/EditMap");
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0))),
                      child: GoogleMapItem(
                        latLng: provider.latLanlist[index],
                        edit: false,
                      ),
                    )
                  ],
                );
              }
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: map,
              );
            }),
      ),
    );
  }
}
