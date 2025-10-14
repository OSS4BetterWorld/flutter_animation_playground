import 'package:collaborators/collaborator.dart';
import 'package:issues/issues/example_sandbox/example_sandbox.dart';
import 'package:shared/widget_registry.dart';
import 'package:showcases/widgets/animated_bar_spectrum/animated_bar_spectrum_demo.dart';

/**
 * Author: Devngmo
 */
class Devngmo extends Collaborator {
  Devngmo({super.githubId = "devngmo"});

  @override
  void registerDemos() {
    iconDemoWidgetRegistry.add(
      WidgetDemoInfo(
        name: AnimatedBarSpectrumDemo.NAME,
        description: AnimatedBarSpectrumDemo.DESCRIPTION,
        createWidget: () => AnimatedBarSpectrumDemo(),
      ),
    );
    //TODO: add my favorite animated icons here

    //TODO: add my favorite animated Cards & Pages here
    // cardAndPageDemoWidgetRegistry.add(() => AwesomePageAnimationDemo());
  }

  @override
  void registerIssues() {
    issueExampleRegistry.add(WidgetDemoInfo(name: ExampleSandbox.NAME, description: ExampleSandbox.DESCRIPTION, createWidget: () => ExampleSandbox()));

    //TODO: add my next example of issues
  }
}
