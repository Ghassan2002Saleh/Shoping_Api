import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopingapi/api/api_setting.dart';
import 'package:shopingapi/model/user.dart';

class UserApiController {
  Future<List<User>> readUsers() async {
    try {
      Uri uri = Uri.parse(ApiSettings.users);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var jsonArray = jsonResponse['data'] as List;
        return jsonArray
            .map((jsonObject) => User.fromJson(jsonObject))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
