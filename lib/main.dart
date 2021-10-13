import 'package:flutter/material.dart';
import 'package:random_color_tester/common/ui_strings.dart';
import 'package:random_color_tester/screens/home_screen.dart';

void main() {
  runApp(const RandomColorTester());
}

class RandomColorTester extends StatelessWidget {
  const RandomColorTester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UIStrings.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        toggleableActiveColor: Colors.black,
        colorScheme: const ColorScheme.light(
          primary: Colors.black87,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        toggleableActiveColor: Colors.white,
        colorScheme: const ColorScheme.dark(
          primary: Colors.black,
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
