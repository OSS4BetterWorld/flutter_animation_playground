import 'package:flutter/material.dart';
import 'package:shared/widget_registry.dart';

class IssueBrowsingScreen extends StatefulWidget {
  const IssueBrowsingScreen({super.key});

  @override
  State<IssueBrowsingScreen> createState() => _IssueBrowsingScreenState();
}

class _IssueBrowsingScreenState extends State<IssueBrowsingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Issue Playground")),
      body: ListView.builder(
      itemCount: issueExampleRegistry.count,
        itemBuilder: (context, index) {
        var iss = issueExampleRegistry.getDemoAt(index);
        return InkWell(
          onTap: ()  => Navigator.push(context, MaterialPageRoute(builder: (_) => iss.createWidget())),
          child: Card(
            child: ListTile(
              title: Text(iss.name, style: TextStyle(color: Colors.blue, fontSize: 20)),
              subtitle: Text(iss.description),
            ),
          ),
        );
    }));
  }
}
