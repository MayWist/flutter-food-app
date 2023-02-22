import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterappfood/viewmodels/map_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class EditMap extends StatelessWidget {
  EditMap({super.key});
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    MapViewModel provider = Provider.of<MapViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        floatingActionButton: FloatingActionButton.extended(
            label: Text("บันทึกตำแหน่ง"),
            icon: Icon(Icons.place),
            onPressed: () {}),
        body: GoogleMap(
          onTap: (LatLng latLng) {
            provider.latLanlist[provider.selectedindex] = latLng;
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
              position: provider.selectedLatLng,
            )
          },
        ));
  }
}
