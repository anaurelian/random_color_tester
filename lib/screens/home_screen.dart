import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:random_color_tester/common/ui_strings.dart';
import 'package:random_color_tester/utils/color_utils.dart';

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
        Text(UIStrings.colorTypeSubtitle, style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 8.0),
        Wrap(
          // spacing: 8.0,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(UIStrings.luminositySubtitle, style: Theme.of(context).textTheme.headline6),
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            _buildLuminosityChip(Luminosity.random),
            _buildLuminosityChip(Luminosity.bright),
            _buildLuminosityChip(Luminosity.light),
            _buildLuminosityChip(Luminosity.dark),
          ],
        ),
      ],
    );
  }

  Widget _buildColorTypeChip(ColorType colorType) {
    final Color color = _colorTypeColors[colorType]!;
    final Color contrastColor = ColorUtils.contrastColor(color);

    return FilterChip(
      visualDensity: VisualDensity.compact,
      showCheckmark: false,
      // avatar: _colorTypes.contains(colorType)
      //     ? Icon(Icons.check_circle, color: contrastColor.withOpacity(0.75))
      //     // : const SizedBox.shrink(),
      //     : Icon(Icons.circle_outlined, color: Colors.white),
      avatar: CircleAvatar(
        backgroundColor: Colors.white,
        child: _colorTypes.contains(colorType)
            ? const Icon(Icons.check_circle, color: Colors.black87)
            : const SizedBox.shrink(),
      ),

      // backgroundColor: _colorTypeColors[colorType]!.withOpacity(0.5),
      // selectedColor: _colorTypeColors[colorType],
      backgroundColor: _colorTypeColors[colorType],
      selectedColor: _colorTypeColors[colorType],
      shape: StadiumBorder(
        side: BorderSide(
          color: color,
          width: 2.0,
        ),
      ),
      checkmarkColor: contrastColor,
      // backgroundColor: Colors.transparent,
      // selectedColor: Colors.transparent,
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(color: color, width: 1),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      // avatarBorder: Border.fromBorderSide(BorderSide.none),
      // avatarBorder: CircleBorder(side: BorderSide(color: Colors.black)),
      // avatar: const CircleAvatar(
      //   backgroundColor: Colors.white,
      // ),
      // avatar: const SizedBox(width: 8.0, height: 8.0,),
      label: Text(
        describeEnum(colorType),
        style: Theme.of(context).textTheme.caption!.copyWith(color: contrastColor),
      ),
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

    // return CheckboxListTile(
    //   title: Text(describeEnum(colorType)),
    //   controlAffinity: ListTileControlAffinity.leading,
    //   dense: true,
    //   value: _colorTypes.contains(colorType),
    //   onChanged: (bool? value) {
    //     setState(() {
    //       if (value != null) {
    //         if (value) {
    //           _colorTypes.add(colorType);
    //         } else {
    //           _colorTypes.remove(colorType);
    //         }
    //       }
    //     });
    //   },
    // );
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
