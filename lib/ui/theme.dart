import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class Themes {

  // 98A2B3  F2F4F7
  static final darkMode = ThemeData(
      backgroundColor: const Color(0XFF000F24),
      scaffoldBackgroundColor: const Color(0XFF000F24),
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(const Color(0XFFF2F4F7)),
          checkColor: MaterialStateProperty.all<Color>(const Color(0XFF000F24)),
      ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(const Color(0XFFF2F4F7)),

    )
  );

  static final lightMode = ThemeData(
      backgroundColor: const Color(0XFFE5E5E5),
      scaffoldBackgroundColor: const Color(0XFFE5E5E5),
      primaryColor: Colors.white,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(const Color(0XFF1C1917)),
        checkColor: MaterialStateProperty.all<Color>(const Color(0XFFE5E5E5))
      ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(const Color(0XFF001637)),

    )
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
