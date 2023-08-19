import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopingapi/api/api_response.dart';
import 'package:shopingapi/api/api_setting.dart';
import 'package:shopingapi/api/controllers/api_helper.dart';
import 'package:shopingapi/model/student.dart';
import 'package:http/http.dart' as http;
import 'package:shopingapi/pref/shared_pref_controller.dart';
import 'package:shopingapi/util/helper.dart';

class AuthApiController with ApiHelper, Helper {
  Future<bool> register(BuildContext context,
      {required Student student}) async {
    try {
      Uri uri = Uri.parse(ApiSettings.register);
      var response = await http.post(uri, body: {
        "full_name": student.fullName,
        "email": student.email,
        "password": student.password,
        "gender": student.gender
      });
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: jsonResponse['message'], isError: jsonResponse['status']);
        return true;
      }
      // ignore: use_build_context_synchronously
      ShowSnackBar(context,
          title: jsonResponse['message'], isError: jsonResponse['status']);
      return false;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context,
          title: 'Error Server Please Try agan', isError: false);
      return false;
    }
  }

  Future<bool> login(BuildContext context,
      {required String email, required String password}) async {
    try {
      Uri uri = Uri.parse(ApiSettings.login);
      var response = await http.post(uri, body: {
        "email": email,
        "password": password,
      });
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        if (response.statusCode == 200) {
          var jsonObject = jsonResponse['object'];
          Student student = Student.fromJson(jsonObject);
          SharedPrefController().save(student: student);
        }
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: jsonResponse['message'], isError: jsonResponse['status']);
        return false;
      }
      // ignore: use_build_context_synchronously
      ShowSnackBar(context,
          title: 'Error Server Please Try agan', isError: false);
      return false;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context,
          title: 'Error Server Please Try agan', isError: false);
      return false;
    }
  }
}
