import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Author: Devngmo
 */
class AnimatedBarSpectrumController {
  double _speed = 1;
  Color _color  = Colors.blue;
  int _numOfBars = 3;
  int _barWidth = 5;
  int _barMaxHeight = 20;
  int _barMinHeight = 1;

  AnimatedBarSpectrumController({
    int numOfBars = 3, // num of bars
    int barWidth = 5, // width of a bar
    int barMaxHeight = 20, // max height of a bar
    int barMinHeight = 1, // min height of a bar
    Color color = Colors.blue, // bar color
    double speed = 1, // bar animation speed
  }) {
    _speed = speed;
    _color = color;
    _barMaxHeight = barMaxHeight;
    _barMinHeight = barMinHeight;
    _numOfBars = numOfBars;
    _barWidth = barWidth;
  }

  late _AnimatedBarSpectrumState _state;
  bind(_AnimatedBarSpectrumState state) {
    _state = state;
  }

  Color get color => _color;
  set color(Color value) {
    _color = value;
    _state.onConfigChanged();
  }

  double get speed => _speed;
  set speed(double value) {
    _speed = value;
    _state.onConfigChanged();
  }

  int get barMaxHeight => _barMaxHeight;
  set barMaxHeight(int value) {
    _barMaxHeight = value;
    _state.onConfigChanged();
  }

  int get barMinHeight => _barMinHeight;
  set barMinHeight(int value) {
    _barMinHeight = value;
    _state.onConfigChanged();
  }

  int get barWidth => _barWidth;
  set barWidth(int value) {
    _barWidth = value;
    _state.onConfigChanged();
  }

  int get numOfBars => _numOfBars;
  set numOfBars(int value) {
    _numOfBars = value;
    _state.onConfigChanged();
  }
}

/**
 * Display an Animated Bar Spectrum as an Icon ( with small size as default )
 */
class AnimatedBarSpectrum extends StatefulWidget {
  const AnimatedBarSpectrum({
    super.key,
    this.padding = const EdgeInsets.all(5), // container spacing
    required this.controller,
  });
  final AnimatedBarSpectrumController controller;
  final EdgeInsets padding;

  @override
  State<AnimatedBarSpectrum> createState() => _AnimatedBarSpectrumState();
}

class BarAnim {
  double height;
  double maxHeight;
  bool up; // bar height increase ( up ) or decrease ( down )
  BarAnim({required this.height, required this.up, required this.maxHeight});
}

class _AnimatedBarSpectrumState extends State<AnimatedBarSpectrum>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  int index = 0;
  List<BarAnim> barHeights = [];

  int get numOfBars => widget.controller.numOfBars;
  int get barMinHeight => widget.controller.barMinHeight;
  int get barMaxHeight => widget.controller.barMaxHeight;
  int get barWidth => widget.controller.barWidth;
  double get speed => widget.controller.speed;

  void setupBars() {
    barHeights = [];
    for (int i = 0; i < numOfBars; i++) {
      barHeights.add(
        BarAnim(
          height: barMaxHeight.toDouble() / 2,
          up: rnd.nextBool(),
          maxHeight: getRandomHeight(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.bind(this);

    setupBars();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..repeat(reverse: true);
    _animController.addListener(() {
      for (int i = 0; i < barHeights.length; i++) {
        var b = barHeights[i];
        if (b.up) {
          b.height += speed;
          if (b.height > b.maxHeight) {
            b.up = false;
            b.height = b.maxHeight;
          }
        } else {
          b.height -= speed;
          if (b.height < barMinHeight) {
            b.up = true;
            b.height = barMinHeight.toDouble();
            b.maxHeight = getRandomHeight();
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Random rnd = Random();

  void onConfigChanged() {
    setState(() {
      setupBars();
    });
  }

  double getRandomHeight() {
    return barMinHeight + rnd.nextDouble() * (barMaxHeight - barMinHeight);
  }

  @override
  Widget build(BuildContext context) {
    if (barHeights.length != numOfBars) {
      setupBars();
    }
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        List<Widget> bars = [];
        int n = min(numOfBars, barHeights.length);
        for (int i = 0; i < n; i++) {
          bars.add(
            Container(
              color: widget.controller.color,
              width: barWidth.toDouble(),
              height: barHeights[i].height,
            ),
          );
        }
        return Container(
          padding: widget.padding,
          height: barMaxHeight + widget.padding.vertical,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: bars,
          ),
        );
      },
    );
  }
}
