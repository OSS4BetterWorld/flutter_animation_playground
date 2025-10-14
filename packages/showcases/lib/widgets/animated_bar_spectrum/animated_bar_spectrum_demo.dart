import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared/generic_ui_builder.dart';
import 'package:showcases/widgets/animated_bar_spectrum/animated_bar_spectrum.dart';
import 'package:showcases/widgets/showcase_ui_builder.dart';

class AnimatedBarSpectrumDemo extends StatefulWidget {
  const AnimatedBarSpectrumDemo({super.key});
  static String NAME = "Animated Bar Spectrum";
  static String DESCRIPTION = "A simple animated bar spectrum icon";
  @override
  State<AnimatedBarSpectrumDemo> createState() =>
      _AnimatedBarSpectrumDemoState();
}

class _AnimatedBarSpectrumDemoState extends State<AnimatedBarSpectrumDemo> {
  AnimatedBarSpectrumController absController = AnimatedBarSpectrumController();
  @override
  Widget build(BuildContext context) {
    return ShowcaseUIBuilder.buildWidgetDemo(
      AnimatedBarSpectrumDemo.NAME,
      "Author: Devngmo" +
          "\nSource Path: showcases\\lib\\widgets\\animated_bar_spectrum" +
          "\n${AnimatedBarSpectrumDemo.DESCRIPTION}",
      AnimatedBarSpectrum(controller: absController),
      configPanel: buildConfigPanel(),
    );
  }

  Widget buildConfigPanel() {
    return GenericUIBuilder.buildCard(
      'Settings',
      Column(
        children: [
          Text("Num of bars: ${absController.numOfBars}"),
          Slider(
            min: 1,
            max: 20,
            divisions: 20,
            value: absController.numOfBars.toDouble(),
            onChanged: (value) {
              setState(() {
                absController.numOfBars = value.toInt();
              });
            },
          ),
          Text("Bar Max Height: ${absController.barMaxHeight}"),
          Slider(
            min: 1,
            max: 100,
            divisions: 100,
            value: absController.barMaxHeight.toDouble(),
            onChanged: (value) {
              setState(() {
                absController.barMaxHeight = value.toInt();
              });
            },
          ),
          Text("Bar Min Height: ${absController.barMinHeight}"),
          Slider(
            min: 1,
            max: absController.barMaxHeight.toDouble(),
            value: absController.barMinHeight.toDouble(),
            onChanged: (value) {
              setState(() {
                absController.barMinHeight = value.toInt();
              });
            },
          ),
          Text("Bar Width: ${absController.barWidth}"),
          Slider(
            min: 1,
            max: 50,
            divisions: 50,
            value: absController.barWidth.toDouble(),
            onChanged: (value) {
              setState(() {
                absController.barWidth = value.toInt();
              });
            },
          ),
          Text("Speed: ${absController.speed.toStringAsFixed(1)}"),
          Slider(
            min: 0.1,
            max: 10,
            divisions: 20,
            value: absController.speed,
            onChanged: (value) {
              setState(() {
                absController.speed = value;
              });
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Color:"),
              InkWell(
                onTap: () {
                  showColorPicker();

                },
                child: Container(
                  width: 100,
                  height: 40,
                  child: Card(color: absController.color),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showColorPicker() {
      ColorPicker(
              color: absController.color,
              onColorChanged: (value) {
                setState(() {
                  absController.color = value;
                });
              },
        actionButtons: ColorPickerActionButtons(
            okButton: false,
          dialogActionButtons: false
        )
        ).showPickerDialog(context);
  }
}
