import 'package:shopingapi/api/api_response.dart';

mixin ApiHelper {
  ApiResponse get failedResponse =>
      ApiResponse(message: 'Try agan', status: false);
}
