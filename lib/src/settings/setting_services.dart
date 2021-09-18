import 'package:flutter/material.dart';

class SettingsServices {
  Future<ThemeMode> getThemeMode() async => ThemeMode.system;
}
