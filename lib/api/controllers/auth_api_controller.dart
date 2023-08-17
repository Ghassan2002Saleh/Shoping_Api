import 'dart:convert';
import 'package:shopingapi/api/api_response.dart';
import 'package:shopingapi/api/api_setting.dart';
import 'package:shopingapi/api/controllers/api_helper.dart';
import 'package:shopingapi/model/student.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelper {
  Future<ApiResponse> register({required Student student}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      "full_name": student.fullName,
      "email": student.email,
      "password": student.password,
      "gender": student.gender
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], status: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> login(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['object'];
        Student student = Student.fromJson(jsonObject);
      }
      return ApiResponse(
          message: jsonResponse['message'], status: jsonResponse['status']);
    }
    return failedResponse;
  }
}
