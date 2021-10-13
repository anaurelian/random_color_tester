// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:random_color_tester/utils/color_utils.dart';

class ColorListItem extends StatelessWidget {
  const ColorListItem({
    Key? key,
    required this.index,
    required this.color,
    this.onTap,
  }) : super(key: key);

  final int index;

  final Color color;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = ColorUtils.contrastColor(color);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.all(64.0),
        tileColor: color,
        subtitle: Text(
          ColorUtils.toHex(color),
          style: Theme.of(context).textTheme.subtitle2!.copyWith(color: contrastColor),
        ),
        title: Text(
          index.toString(),
          style: Theme.of(context).textTheme.caption!.copyWith(color: contrastColor),
        ),
        onTap: onTap,
      ),
    );
  }
}
