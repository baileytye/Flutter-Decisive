import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: Center(
        child: Hero(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
              tag: 'tag',
            ),
      ),
    );
  }
}