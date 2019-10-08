import 'dart:core';

import 'package:decisive/data/models/criteria.dart';
import 'package:decisive/data/models/option.dart';
import 'package:decisive/data/models/project.dart';

class ProjectsRepository {
  List<Project> _projects;

  ProjectsRepository.instance() {
    _projects = List<Project>();

    _projects.add(Project(
      name: 'House',
      description: "This is a description for testing purposes",
      dateCreated: DateTime.now(),
      criteria: [
        Criteria(name: 'Garden', type: Type.starRating),
        Criteria(name: 'Yard size'),
        Criteria(name: 'Driveway', type: Type.checkbox),
      ],
      options: [
        Option(
          name: 'House 1',
          criteriaValues: [3, 420, 1],
        ),
      ],
    ));
  }

  Future<List<Project>> getProjects(String userId) {
    return Future.delayed(Duration(milliseconds: 10), () {
      return _projects;
    });
  }

  Future<Project> getProjectWithId(String id) {
    return Future.delayed(Duration(milliseconds: 10), () {
      return _projects[0];
    });
  }
}
