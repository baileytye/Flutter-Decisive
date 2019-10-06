import 'package:decisive/data/models/category.dart';
import 'package:decisive/data/models/criteria.dart';
import 'package:decisive/data/models/option.dart';
import 'package:decisive/data/models/user.dart';

class Project {

  String name, projectId, ownerId;
  DateTime dateCreated;
  bool hasPrice;

  List<User> sharedUsers;
  List<Option> options;
  List<Criteria> criteria;
  List<Category> categories;

}