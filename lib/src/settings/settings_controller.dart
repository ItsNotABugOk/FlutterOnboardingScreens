import 'package:flutter/material.dart';

import 'setting_services.dart';

class SettingsController with ChangeNotifier {
  final SettingsServices settingsServices;
  late ThemeMode _themeMode;
  SettingsController(this.settingsServices);

  ThemeMode get themeMode => _themeMode;
  Future<void> loadSettings() async {
    _themeMode = await settingsServices.getThemeMode();
    notifyListeners();
  }

  Future<void> toggleThemeMode() async {
    _themeMode == ThemeMode.dark
        ? _themeMode = ThemeMode.light
        : _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  Future<void> changeThemeMode(
      [ThemeMode? newThemeMode = ThemeMode.dark]) async {
    if (newThemeMode == null || newThemeMode == _themeMode) {
      return;
    }
    _themeMode = newThemeMode;

    notifyListeners();
  }
}
