import 'package:decisive/data/models/project.dart';
import 'package:decisive/data/repositories/projects_repository.dart';
import 'package:decisive/data/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProjectsModel with ChangeNotifier {
  List<Project> _projects;
  ProjectsRepository projectsRepo;
  UserRepository userRepo;

  ProjectsModel.instance() {
    projectsRepo = ProjectsRepository.instance();
    userRepo = UserRepository.instance();
  }

  _loadProjects(String userId) async{
    print("Loading projects with user id: $userId");
    _projects = await projectsRepo.getProjects(userId);
    notifyListeners();
  }

  List<Project> get projects {
    print('Getting projects');
    if(_projects == null){
      _projects = List<Project> ();
      _loadProjects("jkh");
    }
    return _projects;
  }

  set projects(List<Project> projects) {
    _projects = projects;
  }
}
