import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterappfood/viewmodels/map_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class EditMap extends StatefulWidget {
  EditMap({super.key});

  @override
  State<EditMap> createState() => _EditMapState();
}

class _EditMapState extends State<EditMap> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    MapViewModel provider = Provider.of<MapViewModel>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: Text("บันทึกตำแหน่ง"),
            icon: Icon(Icons.place),
            onPressed: () {
              Navigator.pushNamed(context, "/FoodDeliveryLocation");
            }),
        body: GoogleMap(
          onTap: (LatLng latLng) async {
            provider.latLanlist[provider.selectedindex] = await latLng;
          },
          mapType: MapType.normal,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition:
              CameraPosition(target: provider.selectedLatLng, zoom: 15),
          markers: {
            Marker(
                markerId: const MarkerId("1"),
                position: provider.latLanlist[provider.selectedindex],
                draggable: true,
                onDragEnd: (LatLng latLng) async {
                  provider.latLanlist[provider.selectedindex] = await latLng;
                })
          },
          // markers: {
          //   Consumer<MapViewModel>(
          //       builder: (BuildContext context, bottomnav, Widget? child) {
          //     return Marker(markerId: MarkerId("value"));
          //     }
          //     );
          // },
        ));
  }
}
