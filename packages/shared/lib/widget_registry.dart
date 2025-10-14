import 'package:flutter/material.dart';

class WidgetDemoInfo {
  final String name;
  final String description;
  final Widget Function() createWidget;
  WidgetDemoInfo({required this.name, required this.description, required this.createWidget});

}

class WidgetRegistry {
  List<WidgetDemoInfo> _allDemos = [];

  int get count => _allDemos.length;
  WidgetDemoInfo getDemoAt(int index) => _allDemos[index];

  add(WidgetDemoInfo demo) {
    if (!_allDemos.contains(demo)) {
      _allDemos.add(demo);
    }
  }
}

final iconDemoWidgetRegistry = WidgetRegistry();
final cardAndPageDemoWidgetRegistry = WidgetRegistry();
//TODO: add new collection of demo here


final issueExampleRegistry = WidgetRegistry();