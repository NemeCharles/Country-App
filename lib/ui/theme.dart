import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class Themes {

  // 98A2B3  F2F4F7
  static final darkMode = ThemeData(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: const Color(0XFF000F24),
      primaryColor: Colors.black,
      brightness: Brightness.dark
  );

  static final lightMode = ThemeData(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: const Color(0XFFFFFFFF),
      primaryColor: Colors.white,
      brightness: Brightness.light
  );

}

class ThemeServices {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  bool get loadTheme => _box.read(_key) ?? false;
  ThemeMode get theme => loadTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    Get.changeThemeMode(loadTheme ? ThemeMode.light : ThemeMode.dark);
    _saveTheme(!loadTheme);
  }
  void _saveTheme(bool val) {
    _box.write(_key, val);
  }
}
