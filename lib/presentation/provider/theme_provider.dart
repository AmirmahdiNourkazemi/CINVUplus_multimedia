import 'package:flutter/cupertino.dart';

import '../../data/shared_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  SharedPrefs sharedPrefs = SharedPrefs();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    sharedPrefs.setDarkTheme(value);
    notifyListeners();
  }
}
