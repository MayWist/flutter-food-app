import 'dart:io';

import 'package:flutterappfood/utility/constants.dart';
import 'package:http/http.dart' as http;

class Success {
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure {
  int code;
  Object errorResponse;
  Failure({required this.code, required this.errorResponse});
}

Future<Object> callApi(
  http.Response response,
) async {
  try {
    print("CallApi StatusCode: ${response.statusCode}");
    print(response.request);
    print(response.body);
    if (SUCCESS == response.statusCode) {
      return Success(code: SUCCESS, response: response.body);
    }
    return Failure(
        code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
  } on HttpException {
    return Failure(code: NO_INTERNET, errorResponse: 'No Internet Connection');
  } on SocketException {
    return Failure(code: NO_INTERNET, errorResponse: 'No Internet Connection');
  } on FormatException {
    return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
  }
}
