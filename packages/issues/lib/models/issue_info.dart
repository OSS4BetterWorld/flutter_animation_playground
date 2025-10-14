import 'package:flutter/material.dart';

class IssueInfo {
  final String name;
  final String description;
  final Widget Function() createWidget;
  IssueInfo({required this.name, required this.description, required this.createWidget});
}