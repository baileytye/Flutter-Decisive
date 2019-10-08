
import 'package:decisive/data/models/project.dart';
import 'package:decisive/ui/common/card_project.dart';
import 'package:flutter/material.dart';

class SharingScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, position) {
          return _buildProjectCard();
        },
        childCount: 2,
      ),
    );
  }
}

_buildProjectCard() {
  return ProjectCard(project: Project(),);
}
