import 'package:flutter/material.dart';
import 'package:shared/widget_registry.dart';

class WidgetDemoScreen extends StatefulWidget {
  const WidgetDemoScreen({super.key, required this.title, required this.widgetRegistry});
  final WidgetRegistry widgetRegistry;
  final String title;

  @override
  State<WidgetDemoScreen> createState() => _WidgetDemoScreenState();
}

class _WidgetDemoScreenState extends State<WidgetDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(child: buildContent()),
    );
  }

  Widget buildContent() {
    return ListView.builder(
      itemCount: widget.widgetRegistry.count,
        itemBuilder: (context, index) {
        return widget.widgetRegistry.getDemoAt(index).createWidget();
    });
  }
}
