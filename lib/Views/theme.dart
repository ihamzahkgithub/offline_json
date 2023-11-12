import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs; // Default theme is light

  // Function to toggle the theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
