import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:random_color_tester/common/ui_strings.dart';
import 'package:random_color_tester/widgets/custom_chips.dart';
import 'package:random_color_tester/widgets/options_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<ColorType> _colorTypes = {ColorType.random};

  Luminosity _luminosity = Luminosity.random;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UIStrings.appName),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Container(
          color: Colors.black12,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(UIStrings.colorTypeSubtitle, style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16.0),
              Wrap(
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
            ],
          ),
        ),
        const SizedBox(height: 16.0),
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
        // Flex(
        //   direction: Axis.horizontal,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Expanded(
        //       child: Container(
        //         color: Colors.black12,
        //         padding: const EdgeInsets.all(16.0),
        //         child: Column(
        //
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(UIStrings.colorTypeSubtitle, style: Theme.of(context).textTheme.headline6),
        //             const SizedBox(height: 16.0),
        //             _buildColorTypeChip(ColorType.random),
        //             _buildColorTypeChip(ColorType.red),
        //             _buildColorTypeChip(ColorType.orange),
        //             _buildColorTypeChip(ColorType.yellow),
        //             _buildColorTypeChip(ColorType.green),
        //             _buildColorTypeChip(ColorType.blue),
        //             _buildColorTypeChip(ColorType.purple),
        //             _buildColorTypeChip(ColorType.pink),
        //             _buildColorTypeChip(ColorType.monochrome),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Flexible(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           _buildLuminosityChip(Luminosity.random),
        //           _buildLuminosityChip(Luminosity.bright),
        //           _buildLuminosityChip(Luminosity.light),
        //           _buildLuminosityChip(Luminosity.dark),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildColorTypeChip(ColorType colorType) {
    return ColorFilterChip(
      color: _colorTypeColors[colorType]!,
      label: describeEnum(colorType),
      selected: _colorTypes.contains(colorType),
      onSelected: (bool value) {
        setState(() {
          if (value) {
            _colorTypes.add(colorType);
          } else {
            _colorTypes.remove(colorType);
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
