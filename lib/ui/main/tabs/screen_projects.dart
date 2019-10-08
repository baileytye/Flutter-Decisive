import 'package:decisive/data/models/project.dart';
import 'package:decisive/ui/common/card_project.dart';
import 'package:decisive/ui/main/model_projects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProjectsModel projectsModel = Provider.of<ProjectsModel>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, position) {
          return _buildProjectCard(projectsModel.projects[position]);
        },
        childCount: projectsModel.projects.length,
      ),
    );
  }

  _buildProjectCard(Project project) {
    return ProjectCard(project: project,);
  }
}
