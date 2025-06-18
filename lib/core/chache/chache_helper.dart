import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //--------Init sharedPrefernces--------------------
  cacheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  //--------Get Data that already saved to database--------------------

  String? getData({required String key}) {
    return sharedPreferences.getString(key);
  }
  //-------- Save Data--------------------

  Future<bool> savedData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setBool(key, value);
    }
  }
  //-------- if database contains key--------------------

  Future<bool> containskey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }
  //--------Remove data--------------------

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
  //--------Clear Data--------------------

  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
  