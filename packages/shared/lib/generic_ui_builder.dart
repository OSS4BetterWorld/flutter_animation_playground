import 'package:flutter/material.dart';

class GenericUIBuilder {
  static Widget buildCard(String title, Widget content) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.maxFinite,
            child: Text(title, style: TextStyle(color:  Colors.white))),
          content
        ],
      ),
    );
  }
}