import 'dart:io';

import 'package:shopingapi/api/api_response.dart';
import 'package:shopingapi/pref/shared_pref_controller.dart';

mixin ApiHelper {
  ApiResponse get failedResponse =>
      ApiResponse(message: 'Try agan', status: false);

  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    };
  }
}
