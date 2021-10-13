// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

class UIStrings {
  // -----------------------------------------------------------------------------------------------
  // App
  // -----------------------------------------------------------------------------------------------

  static const String appName = 'Random Color Tester';

  // -----------------------------------------------------------------------------------------------
  // Home Screen
  // -----------------------------------------------------------------------------------------------

  static const String helpTooltip = 'What is this app?';
  static const String helpUrl = 'https://github.com/anaurelian/random_color_tester';

  static const String generateSubtitle = 'Generate';
  static const String colorTypeSubtitle = 'Color Type';
  static const String luminositySubtitle = 'Luminosity';

  static const String generateButton = 'GENERATE';

  // -----------------------------------------------------------------------------------------------
  // Colors Screen
  // -----------------------------------------------------------------------------------------------

  static String colorsScreen(int count) => '$count Random Colors';

  // -----------------------------------------------------------------------------------------------
  // Color Preview Screen
  // -----------------------------------------------------------------------------------------------

  static const String copyTooltip = 'Copy color code to clipboard';
  static const String copiedSnackBar = 'Color code copied to clipboard';
}
