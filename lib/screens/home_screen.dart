import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:random_color_tester/common/ui_strings.dart';
import 'package:random_color_tester/screens/colors_screen.dart';
import 'package:random_color_tester/widgets/custom_chips.dart';
import 'package:random_color_tester/widgets/options_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _colorCount = 100.0;

  final Set<ColorType> _colorTypeSet = {ColorType.random};

  Luminosity _luminosity = Luminosity.random;

  void _generatePressed() {
    Options options = Options(
      count: _colorCount.toInt(),
      format: Format.rgbArray,
      colorType: _colorTypeSet.toList(),
      luminosity: _luminosity,
    );
    final List rgbColors = RandomColor.getColor(options);
    List<Color> colors = rgbColors.map((rgb) => Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1.0)).toList();

    Navigator.push(context, MaterialPageRoute(builder: (context) => ColorsScreen(colors: colors)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UIStrings.appName),
      ),
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.build),
        label: const Text(UIStrings.generateButton),
        onPressed: _generatePressed,
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        OptionsContainer(
          title: UIStrings.generateSubtitle,
          child: Column(
            children: [
              Text('${_colorCount.toInt()} color${_colorCount != 1 ? 's' : ''}'),
              Slider(
                min: 1,
                max: 1000,
                value: _colorCount,
                onChanged: (double value) {
                  setState(() => _colorCount = value);
                },
              ),
            ],
          ),
        ),
        OptionsContainer(
          title: UIStrings.colorTypeSubtitle,
          child: Wrap(
            spacing: 8.0,
            alignment: WrapAlignment.spaceBetween,
            children: [
              _buildColorTypeChip(ColorType.random),
              _buildColorTypeChip(ColorType.red),
              _buildColorTypeChip(ColorType.orange),
              _buildColorTypeChip(ColorType.yellow),
              _buildColorTypeChip(ColorType.green),
              _buildColorTypeChip(ColorType.blue),
              _buildColorTypeChip(ColorType.purple),
              _buildColorTypeChip(ColorType.pink),
              _buildColorTypeChip(ColorType.monochrome),
            ],
          ),
        ),
        OptionsContainer(
          title: UIStrings.luminositySubtitle,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              _buildLuminosityChip(Luminosity.random),
              _buildLuminosityChip(Luminosity.bright),
              _buildLuminosityChip(Luminosity.light),
              _buildLuminosityChip(Luminosity.dark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorTypeChip(ColorType colorType) {
    return ColorFilterChip(
      color: _colorTypeColors[colorType]!,
      label: describeEnum(colorType),
      selected: _colorTypeSet.contains(colorType),
      onSelected: (bool value) {
        setState(() {
          if (value) {
            _colorTypeSet.add(colorType);
          } else {
            _colorTypeSet.remove(colorType);
          }
        });
      },
    );
  }

  Widget _buildLuminosityChip(Luminosity luminosity) {
    return ChoiceChip(
      label: Text(describeEnum(luminosity)),
      selected: _luminosity == luminosity,
      onSelected: (bool selected) {
        if (selected) {
          setState(() {
            _luminosity = luminosity;
          });
        }
      },
    );

    // return RadioListTile<Luminosity>(
    //   title: Text(describeEnum(luminosity)),
    //   dense: true,
    //   value: luminosity,
    //   groupValue: _luminosity,
    //   onChanged: (Luminosity? value) => setState(() {
    //     if (value != null) {
    //       _luminosity = value;
    //     }
    //   }),
    // );
  }

  final Map<ColorType, Color> _colorTypeColors = {
    ColorType.random: Colors.teal,
    ColorType.red: Colors.red,
    ColorType.orange: Colors.orange,
    ColorType.yellow: Colors.yellow,
    ColorType.green: Colors.green,
    ColorType.blue: Colors.blue,
    ColorType.purple: Colors.purple,
    ColorType.pink: Colors.pink,
    ColorType.monochrome: Colors.grey,
  };
}
