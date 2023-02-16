// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapItem extends StatelessWidget {
  final LatLng latLng;
  GoogleMapItem({
    Key? key,
    required this.latLng,
  }) : super(key: key);
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    // Text text = Text(text_h);
    GoogleMap googleMap = GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      initialCameraPosition: CameraPosition(target: latLng, zoom: 15),
      markers: {
        Marker(
          markerId: const MarkerId("1"),
          position: latLng,
        )
      },
    );
    // ListTile listTile = ListTile(
    //     leading: Icon(iconData),
    //     title: text,
    //     trailing: IconButton(
    //       icon: Icon(Icons.edit),
    //       onPressed: () {
    //         Navigator.pushNamed(context, "/routeName");
    //       },
    //     ));

    return googleMap;
  }
}
