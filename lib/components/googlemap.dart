// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapItem extends StatelessWidget {
  final LatLng latLng;
  final bool edit;
  GoogleMapItem({
    Key? key,
    required this.latLng,
    required this.edit,

  }) : super(key: key);
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    late GoogleMap googleMap;
    googleMap = GoogleMap(
      mapType: MapType.normal,
      rotateGesturesEnabled: false,
      scrollGesturesEnabled: false,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
      mapToolbarEnabled: false,
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
    return googleMap;
  }
}
