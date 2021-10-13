import 'package:flutter/material.dart';
import 'package:random_color_tester/common/ui_strings.dart';
import 'package:random_color_tester/widgets/color_list_item.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIStrings.colorsScreen(colors.length)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        return ColorListItem(
          index: index + 1,
          color: colors[index],
          onTap: () {
            print(index);
          },
        );
      },
    );
  }
}
