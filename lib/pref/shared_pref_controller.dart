import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopingapi/model/student.dart';

enum PrefKey { id, fullName, email, gender, token, isLoggedIn }

class SharedPrefController {
  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;
  SharedPrefController._();
  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }
  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // save  , clear  ,  isLoggedIn   ,    getByKey<T>   ,  getToken

  Future<void> save({required Student student}) async {
    _sharedPreferences.setBool(PrefKey.isLoggedIn.name, true);
    _sharedPreferences.setInt(PrefKey.id.name, student.id);
    _sharedPreferences.setString(PrefKey.fullName.name, student.fullName);
    _sharedPreferences.setString(PrefKey.email.name, student.email);
    _sharedPreferences.setString(PrefKey.gender.name, student.gender);
    _sharedPreferences.setString(PrefKey.token.name, 'Bearer ${student.token}');
  }

  Future<void> clear() async => _sharedPreferences.clear();
  
}
