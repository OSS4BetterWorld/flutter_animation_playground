import 'package:flutter/material.dart';
import 'package:shared/widget_demo_screen.dart';
import 'package:shared/widget_registry.dart';

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
        buildListItem('Icons', () => WidgetDemoScreen(title: "Icons", widgetRegistry: iconDemoWidgetRegistry)),
        if (cardAndPageDemoWidgetRegistry.count > 0)
          buildListItem('Cards & Pages', () => WidgetDemoScreen(title: "Cards & Pages", widgetRegistry: cardAndPageDemoWidgetRegistry))
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

