import 'package:flutter/material.dart';
import 'package:showcases/animated_icon_screen.dart';
import 'package:showcases/widgets/animated_bar_spectrum/animated_bar_spectrum_demo.dart';
import 'package:showcases/widgets/showcase_ui_builder.dart';

class ShowcaseBrowsingScreen extends StatefulWidget {
  const ShowcaseBrowsingScreen({super.key});

  @override
  State<ShowcaseBrowsingScreen> createState() => _ShowcaseBrowsingScreenState();
}

class _ShowcaseBrowsingScreenState extends State<ShowcaseBrowsingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Showcases"),
      ),
      body: SafeArea(child: buildShowcaseMenu()),
    );
  }

  Widget buildShowcaseMenu() {
    return ListView(
      children: [
        buildListItem('Animated Icons', () => AnimatedIconScreen())
      ],
    );
  }

  Widget buildListItem(String title, Widget Function() createWidget) {
    return Card(
      child: ListTile(title: Text(title),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => createWidget() ))),
    );
  }
}

