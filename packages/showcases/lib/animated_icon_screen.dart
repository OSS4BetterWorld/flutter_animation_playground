import 'package:flutter/material.dart';
import 'package:showcases/widgets/animated_bar_spectrum/animated_bar_spectrum_demo.dart';

class AnimatedIconScreen extends StatefulWidget {
  const AnimatedIconScreen({super.key});

  @override
  State<AnimatedIconScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Icons"),
      ),
      body: SafeArea(child: buildContent()),
    );
  }

  Widget buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnimatedBarSpectrumDemo(),
        ],
      ),
    );
  }
}
