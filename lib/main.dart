import 'package:flutter/material.dart';

import 'app.dart';
import 'src/settings/setting_services.dart';
import 'src/settings/settings_controller.dart';

void main() async {
  final settingsController = SettingsController(SettingsServices());
  settingsController.loadSettings();

  runApp(MyApp(
    settingsController: settingsController,
  ));
}
