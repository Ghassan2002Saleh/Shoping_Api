import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopingapi/api/api_setting.dart';
import 'package:shopingapi/api/api_helper.dart';
import 'package:shopingapi/model/image.dart';
import 'package:http/http.dart' as http;
import 'package:shopingapi/util/helper.dart';

class ImagesApiContrroller with Helper, ApiHelper {
  Future<List<StudenImage>> readImage() async {
    try {
      Uri uri = Uri.parse(ApiSettings.image.replaceFirst('/{id}', ''));
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var objectResponse = jsonResponse['data'] as List;
        return objectResponse
            .map((jsonObject) => StudenImage.fromJson(jsonObject))
            .toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteImage(BuildContext context, {required int id}) async {
    try {
      Uri uri =
          Uri.parse(ApiSettings.image.replaceFirst('{id}', id.toString()));
      var response = await http.delete(uri, headers: headers);
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context,
            title: jsonResponse['message'],
            isError: response.statusCode == 200 ? false : true);
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(context, title: 'Not Fond', isError: true);
      }
      return jsonResponse['status'];
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowSnackBar(context, title: 'There is no internet', isError: true);
      return false;
    }
  }
}
