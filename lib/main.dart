import 'package:country_app/screens/home_screen.dart';
import 'package:country_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Country',
      theme: Themes.lightMode,
      darkTheme: Themes.darkMode,
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}

