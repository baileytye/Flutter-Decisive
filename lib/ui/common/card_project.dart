import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {

  final color;

  ProjectCard({this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Date'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Choices: '),
                ],
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    ),
  );
  }
}