import 'package:decisive/resources/dimensions.dart';
import 'package:flutter/material.dart';

class MyToolbar extends StatelessWidget {
  Color textColor;
  var title;
  var optionsMenu;

  MyToolbar(
      {this.textColor = Colors.blue,
      this.title = 'Title',
      @required this.optionsMenu});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.black54),
      pinned: true,
      brightness: Brightness.light,
      expandedHeight: MyDimensions.expandedAppBarHeight,
      actions: <Widget>[optionsMenu],
      actionsIconTheme: IconThemeData(
        color: Colors.black54,
      ),
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: textColor,
          ),
        ),
        background: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
