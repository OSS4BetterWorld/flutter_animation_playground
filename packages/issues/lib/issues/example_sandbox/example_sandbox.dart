import 'package:flutter/material.dart';

class ExampleSandbox extends StatefulWidget {
  const ExampleSandbox({super.key});
  static const String NAME = "Example Sandbox";
  static const String DESCRIPTION = "Example for everyone try to learn Push Request";
  @override
  State<ExampleSandbox> createState() => _ExampleSandboxState();
}

class _ExampleSandboxState extends State<ExampleSandbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example Sandbox")),
      body: SafeArea(child: buildContent()),
    );
  }

  Widget buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(ExampleSandbox.DESCRIPTION)
        ],
      ),
    );
  }
}
