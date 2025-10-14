import 'package:flutter/material.dart';

class ShowcaseUIBuilder {
  static Widget buildWidgetDemo(String title, String description, Widget w, {Widget? configPanel}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(color:  Colors.blue, fontSize: 20)),
            Text(description, textAlign: TextAlign.justify),
            Card(
              elevation: 0,
                color: Colors.white,
                child: Container(
              padding: EdgeInsets.all(20),
                child: Center(child: w))),
            if (configPanel != null) configPanel
          ],
        ),
      ),
    );
  }
}