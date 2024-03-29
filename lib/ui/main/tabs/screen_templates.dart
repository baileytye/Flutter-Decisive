import 'package:decisive/data/models/project.dart';
import 'package:decisive/ui/common/card_project.dart';
import 'package:flutter/material.dart';

class TemplatesScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, position) {
          return _buildProjectCard();
        },
        childCount: 5,
      ),
    );
  }
}

_buildProjectCard() {
  return ProjectCard(project: Project(),);
}