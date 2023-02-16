import 'dart:convert';

import 'package:http/http.dart' as http;

class MapServices {
  static Future getAddressFromLatLng(double lat, double lng) async {
    const apiKey = 'AIzaSyBsgKAAWC06gZfFh9SZpMOFHmHvcCFFAcI';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    // return callApi(response);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return decodedJson['results'][0]['formatted_address'];
    } else {
      throw Exception('Failed to get address');
    }
  }
}
