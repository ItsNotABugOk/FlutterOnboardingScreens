import 'package:flutter/material.dart';
import 'package:loginui/screens/onboarding/onboarding.dart';
import 'package:loginui/src/settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;
  const MyApp({Key? key, required this.settingsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            subtitle1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF425398),
            ),
            caption: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF425398),
            ),
            subtitle2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF425398),
            ),
            bodyText1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: Color(0xFF425398),
            ),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.light,
          // brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          primaryColorDark: Colors.white,
          backgroundColor: Colors.black,
          textTheme: const TextTheme(
            subtitle1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF425398),
            ),
            caption: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF425398),
            ),
            subtitle2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF425398),
            ),
            bodyText1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: Color(0xFF425398),
            ),
          ),
        ),
        themeMode: settingsController.themeMode,
        builder: (context, child) => const Scaffold(
          body: Onboarding(),

          // Center(
          //   child: TextButton(
          //     onPressed: () {
          //       settingsController.toggleThemeMode();
          //     },
          //     child: Text(
          //       'Switch Themes',
          //       style: Theme.of(context).textTheme.subtitle1,
          //     ),
          //   ),
        ),
      ),
    );
  }
}
