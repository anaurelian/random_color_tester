// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtils {
  /// Converts a Color value into a hexadecimal color string.
  static String toHex(Color color) => '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  static Color contrastColor(Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;
}
