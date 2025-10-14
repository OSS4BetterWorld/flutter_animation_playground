import 'package:issues/issues/example_sandbox/example_sandbox.dart';
import 'package:issues/models/issue_info.dart';

final allIssues = [
  IssueInfo(name: 'Example Sandbox', description: 'This example issue demonstrate how to create new issue', createWidget: () => ExampleSandbox())
];