import 'package:decisive/resources/strings.dart';
import 'package:decisive/router.dart';
import 'package:decisive/ui/common/toolbar.dart';
import 'package:decisive/ui/projectDetails/model_project_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ProjectDetailsMenu { editProject, deleteProject, settings }

class ProjectDetailsScreen extends StatelessWidget {
  final String projectId;
  ProjectDetailsScreen({@required this.projectId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProjectDetailsModel>(
      builder: (context) => ProjectDetailsModel.instance(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<ProjectDetailsModel>(
          builder: (context, project, child) {
            return CustomScrollView(
              slivers: <Widget>[
                MyToolbar(
                  optionsMenu: createOptionsMenu(context),
                  textColor: Colors.black54,
                  title: project.getProject(projectId).name,
                ),
                SliverFillRemaining(
                  child: Text(project.getProject(projectId).description),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void onMenuItemSelected(
      ProjectDetailsMenu result, BuildContext context) async {
    switch (result) {
      case ProjectDetailsMenu.editProject:
        break;
      case ProjectDetailsMenu.deleteProject:
        break;
      case ProjectDetailsMenu.settings:
        Navigator.pushNamed(context, Router.settingsScreen);
        break;
    }
  }

  createOptionsMenu(BuildContext context) {
    return PopupMenuButton<ProjectDetailsMenu>(
      onSelected: (ProjectDetailsMenu result) =>
          onMenuItemSelected(result, context),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: ProjectDetailsMenu.editProject,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(MyStrings.menuEditProject),
            ),
          ),
          PopupMenuItem(
            value: ProjectDetailsMenu.deleteProject,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(MyStrings.menuDeleteProject),
            ),
          ),
          PopupMenuItem(
            value: ProjectDetailsMenu.settings,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(MyStrings.menuSettings),
            ),
          ),
        ];
      },
    );
  }
}
