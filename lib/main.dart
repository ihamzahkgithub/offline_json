import 'package:culms/Views/landing_screen.dart';
import 'package:culms/Views/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController =
      Get.put(ThemeController()); // Initialize the theme controller

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        title: 'Your App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        home: LandingScreen(),
      ),
    );
  }
}
