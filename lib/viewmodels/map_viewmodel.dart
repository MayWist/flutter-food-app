import 'package:flutter/material.dart';
import 'package:flutterappfood/model/map/google_map_model.dart';
import 'package:flutterappfood/repository/googlemap_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  int time = 0;

  String _currentLocationName = "...";
  List _textlist = ["Current location", "บ้าน", "ออฟฟิศ", "SDBStore"];
  List<IconData> _icondata = [
    Icons.home,
    Icons.home,
    Icons.abc,
    Icons.back_hand
  ];
  List<LatLng> latLanlist = [
    LatLng(0, 0),
    LatLng(13.7650836, 100.5379664),
    LatLng(13.7650836, 100.5379664),
    LatLng(13.7650836, 100.5379664)
  ];
  late int _selectedindex;

  int get selectedindex => _selectedindex;

  set selectedindex(int value) {
    _selectedindex = value;
  }

//try to re pos pin in map
  setNewlatlng(int index, LatLng latlng) {
    latLanlist[index] = latlng;
    notifyListeners();
  }

  late LatLng _selectedLatLng;

  LatLng get selectedLatLng => _selectedLatLng;

  set selectedLatLng(LatLng value) {
    _selectedLatLng = value;
  }

  late GoogleMapModel _googleMapModel;

  late LatLng _currentLocationLatLag;

  List get textlist => _textlist;
  List<IconData> get icondata => _icondata;
  String get currentLocationName => _currentLocationName;
  LatLng get currentLocationLatLag => _currentLocationLatLag;

  set currentLocationLatLag(LatLng value) {
    _currentLocationLatLag = value;
  }

  set currentLocationName(String value) {
    _currentLocationName = value;
  }

  set textlist(List value) {
    _textlist = value;
  }

  set icondata(List<IconData> value) {
    _icondata = value;
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    time += 1;
    if (_currentLocationName != "...") return;
    print("do time : $time");
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentLocationLatLag = LatLng(position.latitude, position.longitude);
    }).catchError((e) {
      currentLocationName = e;
    });
    var response = await MapServices.getAddressFromLatLng(
        _currentLocationLatLag.latitude, _currentLocationLatLag.longitude);
    currentLocationName = await response as String;
    notifyListeners();
  }
}
