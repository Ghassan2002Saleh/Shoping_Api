import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopingapi/model/student.dart';

enum PrefKey { id, fullName, email, gender, token, isLoggedIn, code }

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

  //    save

  Future<void> save({required Student student}) async {
    _sharedPreferences.setBool(PrefKey.isLoggedIn.name, true);
    _sharedPreferences.setInt(PrefKey.id.name, student.id);
    _sharedPreferences.setString(PrefKey.fullName.name, student.fullName);
    _sharedPreferences.setString(PrefKey.email.name, student.email);
    _sharedPreferences.setString(PrefKey.gender.name, student.gender);
    _sharedPreferences.setString(PrefKey.token.name, 'Bearer ${student.token}');
  }

//  clear

  Future<bool> clear() async => _sharedPreferences.clear();

//    isLoggedIn

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKey.isLoggedIn.name) ?? false;

//    getByKey<T>

  T? getByKey<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

//     getToken

  String get token => _sharedPreferences.getString(PrefKey.token.name) ?? '';

  Future<void> getCode({required String code}) async {
    _sharedPreferences.setString(PrefKey.code.name, code);
  }
}
