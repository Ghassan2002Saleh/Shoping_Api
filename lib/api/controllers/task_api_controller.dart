import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopingapi/api/api_helper.dart';
import 'package:shopingapi/api/api_setting.dart';
import 'package:http/http.dart' as http;
import 'package:shopingapi/model/task.dart';
import 'package:shopingapi/util/helper.dart';

class TaskApiController with ApiHelper, Helper {
  Future<List<Task>> readTask() async {
    try {
      Uri uri = Uri.parse(ApiSettings.task.replaceFirst('/{id}', ''));
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var objectResponse = jsonResponse['data'] as List;
        return objectResponse
            .map((jsonObject) => Task.fromJson(jsonObject))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> createTask(BuildContext context, {required String title}) async {
    try {
      Uri uri = Uri.parse(ApiSettings.task.replaceFirst('/{id}', ''));
      var response =
          await http.post(uri, body: {'title': title}, headers: headers);
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

  Future<bool> deleteTask(BuildContext context, {required int id}) async {
    try {
      Uri uri = Uri.parse(ApiSettings.task.replaceFirst('{id}', id.toString()));
      var response = await http.delete(uri, headers: headers);

      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context, title: jsonResponse['message'], isError: false);
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context, title: jsonResponse['message'], isError: true);
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

  Future<bool> updateTask(BuildContext context,
      {required int id, required String title}) async {
    try {
      Uri uri = Uri.parse(ApiSettings.task.replaceFirst('{id}', id.toString()));
      var response =
          await http.put(uri, body: {'title': title}, headers: headers);

      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context, title: jsonResponse['message'], isError: false);
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context, title: jsonResponse['message'], isError: true);
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
