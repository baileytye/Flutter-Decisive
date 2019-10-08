import 'package:decisive/data/models/project.dart';
import 'package:decisive/data/repositories/projects_repository.dart';
import 'package:decisive/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class ProjectDetailsModel with ChangeNotifier {
  Project _project;
  ProjectsRepository projectRepo;
  UserRepository userRepo;

  ProjectDetailsModel.instance() {
    projectRepo = ProjectsRepository.instance();
    userRepo = UserRepository.instance();
  }

  _loadProject(String id) async{
    print("Loading project with id: $id");
    _project = await projectRepo.getProjectWithId(id);
    notifyListeners();
  }

  Project getProject(String id) {
    print("Getting project with id: $id");
    if(_project == null){
      _loadProject(id);
    }
    return _project;
  }
}
