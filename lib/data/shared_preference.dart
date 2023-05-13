import 'package:connectplus/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  late SharedPreferences sharedPreferences;

  factory SharedPrefs() {
    return _instance;
  }

  SharedPrefs._internal() {
    init();
  }

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void setDarkTheme(bool value) {
    sharedPreferences.setBool(THEME_STATUS, value);
  }

  bool isDarkTheme() {
    return sharedPreferences.getBool(THEME_STATUS) ?? false;
  }

  void setShowCase(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }

  bool isShowCase(String key) {
    return sharedPreferences.getBool(key) ?? false;
  }
}
