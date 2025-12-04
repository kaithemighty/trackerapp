import 'package:flutter/material.dart';
import 'package:tracker/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  //starts app off in light mode
  ThemeData _themeData = darkMode;

//getter method to access theme from other parts of app
  ThemeData get themeData => _themeData;

//getter method to see if we're in darkmode or not
  bool get isDarkMode => _themeData == darkMode;

//setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    _saveThemePreference(themeData);
    notifyListeners();
  }

//we will use this toggle in a switch later on...
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    }
    else {
      themeData = lightMode;
    }
  }


Future<void> loadThemePreference() async {
  final prefs = await SharedPreferences.getInstance();
  bool? isDarkMode = prefs.getBool('isDarkMode');

  if (isDarkMode == null || !isDarkMode) {
    themeData = lightMode;
  } else {
    themeData = darkMode;
  }
}
Future<void> _saveThemePreference(ThemeData themedata) async {
  final prefs = await SharedPreferences.getInstance();
  bool isDarkMode = themeData == darkMode;
  await prefs.setBool('isDarkMode', isDarkMode);
}
}