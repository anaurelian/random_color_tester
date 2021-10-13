// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_color_tester/common/ui_strings.dart';
import 'package:random_color_tester/utils/color_utils.dart';

class ColorPreviewScreen extends StatelessWidget {
  const ColorPreviewScreen({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;
  
  Future<void> _onCopyPressed(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: ColorUtils.toHex(color)));
    const SnackBar snackBar = SnackBar(content: Text(UIStrings.copiedSnackBar));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = ColorUtils.contrastColor(color);

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        foregroundColor: contrastColor,
        elevation: 0.0,
        title: Text(ColorUtils.toHex(color)),
        actions: [
          IconButton(
            icon: const Icon(Icons.content_copy),
            tooltip: UIStrings.copyTooltip,
            onPressed: () => _onCopyPressed(context),
          ),
        ],
      ),
    );
  }
}
