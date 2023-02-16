import 'package:flutter/material.dart';
import 'package:flutterappfood/model/map/google_map_model.dart';
import 'package:flutterappfood/repository/googlemap_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  String _currentLocationName = "...";
  List _textlist = ["ตำแหน่งปัจจุบัน", "บ้าน", "ออฟฟิศ", "SDBStore"];
  List _icondata = [null, Icons.home, Icons.abc, Icons.back_hand];

  List get icondata => _icondata;

  LatLng? _selectedLatLng;
  late GoogleMapModel _googleMapModel;
  List get textlist => _textlist;

  late LatLng _currentLocationLatLag;

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

  set icondata(List value) {
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
    // if (response is Success) {
    //   print("cell");
    // var res = response.response;
    // print(res.results[0].formattedAddress);
    // print(_currentLocationName.runtimeType);
    // print("cell map safdsafdsafgsdgsdg");
    // print(_googleMapModel.results[0].formattedAddress);
    // }

    // if (response is Failure) {
    //   _currentLocationName = "Failure";
    // }
    // }
  }
}
