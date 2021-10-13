// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

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
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.black,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
