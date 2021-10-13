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

    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8.0),
      clipBehavior: Clip.antiAlias,
      // type: MaterialType.transparency,
      // shape: RoundedRectangleBorder(),
      child: InkWell(
        onTap: onTap,
        child: Container(
          //color: color,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          // decoration: BoxDecoration(
          //   // color: color,
          //   borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          // ),
          padding: const EdgeInsets.all(16.0),
          height: 200.0,
          child: Text(
            ColorUtils.toHex(color),
            style: Theme.of(context).textTheme.headline6!.copyWith(color: contrastColor),
          ),
        ),
      ),
    );
  }
}
