import 'package:decisive/data/models/category.dart';
import 'package:decisive/data/models/criteria.dart';
import 'package:decisive/data/models/option.dart';
import 'package:decisive/data/models/user.dart';
import 'package:flutter/material.dart';

class Project {
  String name, projectId, ownerId, description;
  DateTime dateCreated;
  bool hasPrice;
  MaterialColor color;

  List<User> sharedUsers;
  List<Option> options;
  List<Criteria> criteria;
  List<Category> categories;

  Project(
      {this.name = "Project name",
      this.projectId = "",
      this.ownerId = "",
      this.description = "",
      this.dateCreated,
      this.hasPrice = true,
      this.color = Colors.blue,
      this.sharedUsers = const [],
      this.options = const [],
      this.criteria = const [],
      this.categories = const []});
}
