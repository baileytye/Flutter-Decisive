import 'package:date_format/date_format.dart';
import 'package:decisive/data/models/project.dart';
import 'package:decisive/router.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({@required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Router.projectDetailsScreen, arguments: project.projectId);
        },
        highlightColor: project.color.withOpacity(0.2),
        splashColor: project.color.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              color: project.color,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: project.color,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(project.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 22)),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: (project.description.length > 0),
              child: SizedBox(height: 16),
            ),
            Visibility(
              visible: (project.description.length > 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  project.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            Visibility(
              visible: (project.description.length > 0),
              child: SizedBox(height: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    formatDate(project.dateCreated, [D, ', ', M, ' ', d, ' ', yyyy]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("first"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("second"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
