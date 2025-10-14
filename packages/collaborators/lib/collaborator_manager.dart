import 'package:collaborators/collaborator.dart';
import 'package:collaborators/collaborators/devngmo.dart';

class CollaboratorManager {
  List<Collaborator> collaborators = [];
  CollaboratorManager() {
    collaborators.add(Devngmo());
  }

  void registerIssuesAndDemos() {
    for(var c in collaborators) {
      c.registerIssues();
      c.registerDemos();
    }
  }
}

final collaboratorMgr = CollaboratorManager();