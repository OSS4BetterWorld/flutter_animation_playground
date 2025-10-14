import 'package:flutter/material.dart';

class ExampleSandbox extends StatefulWidget {
  const ExampleSandbox({super.key});

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
          Text("You can learn how to edit source code and create Push Request in this example")
        ],
      ),
    );
  }
}
