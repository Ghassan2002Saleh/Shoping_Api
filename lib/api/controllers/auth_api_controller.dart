import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopingapi/api/api_setting.dart';
import 'package:shopingapi/api/controllers/api_helper.dart';
import 'package:shopingapi/model/student.dart';
import 'package:http/http.dart' as http;
import 'package:shopingapi/pref/shared_pref_controller.dart';
import 'package:shopingapi/util/helper.dart';

class AuthApiController with Helper, ApiHelper {
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
      if (response.statusCode == 201 || response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: jsonResponse['message'],
            isError: response.statusCode == 201 ? false : true);
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: 'Error Server Please Try Agan', isError: true);
      }
      return jsonResponse['status'];
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context, title: 'There is no internet', isError: true);
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
            title: jsonResponse['message'],
            isError: response.statusCode == 200 ? false : true);
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: 'Error Server Please Try Agan', isError: true);
      }

      return jsonResponse['status'];
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context, title: 'There is no internet', isError: true);
      return false;
    }
  }

  Future<bool> logout(BuildContext context) async {
    try {
      Uri uri = Uri.parse(ApiSettings.logout);
      var response = await http.get(uri, headers: headers);
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        await SharedPrefController().clear();

        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: response.statusCode == 200
                ? jsonResponse['message']
                : 'logged out successeflly',
            isError: response.statusCode == 200 ? false : true);
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context, title: 'logged out successeflly', isError: true);
      }

      return jsonResponse['status'];
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context, title: 'There is no internet', isError: true);
      return false;
    }
  }

  Future<bool> forgotPassword(BuildContext context,
      {required String email}) async {
    try {
      Uri uri = Uri.parse(ApiSettings.forgotPassword);
      var response = await http.post(uri, body: {'email': email});
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        if (response.statusCode == 200) {
          print(jsonResponse['code']);
          SharedPrefController().getCode(code: '${jsonResponse['code']}');
          // ignore: use_build_context_synchronously
          ShowSnackBar(context, title: jsonResponse['message'], isError: false);
        } else {
          // ignore: use_build_context_synchronously
          ShowSnackBar(context, title: jsonResponse['message'], isError: true);
        }
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: 'Error Server Please Try Agan', isError: true);
      }

      return jsonResponse['status'];
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context, title: 'There is no internet', isError: true);
      return false;
    }
  }

  Future<bool> resetPassword(BuildContext context,
      {required String email,
      required password,
      required password_confirmation,
      required code}) async {
    try {
      Uri uri = Uri.parse(ApiSettings.resetPassword);
      var response = await http.post(uri, body: {
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
        'code': code
      });
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: jsonResponse['message'],
            isError: response.statusCode == 200 ? false : true);
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: 'Error Server Please Try Agan', isError: true);
      }

      return jsonResponse['status'];
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context, title: 'There is no internet', isError: true);
      return false;
    }
  }


}
