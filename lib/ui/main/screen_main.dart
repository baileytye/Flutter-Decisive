import 'package:decisive/data/repositories/user_repository.dart';
import 'package:decisive/resources/strings.dart';
import 'package:decisive/router.dart';
import 'package:decisive/ui/common/toolbar.dart';
import 'package:decisive/ui/common/widget_animated_bottom_bar.dart';
import 'package:decisive/ui/main/model_projects.dart';
import 'package:decisive/ui/main/tabs/screen_projects.dart';
import 'package:decisive/ui/main/tabs/screen_sharing.dart';
import 'package:decisive/ui/main/tabs/screen_templates.dart';
import 'package:decisive/ui/projectDetails/model_project_details.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

enum MainMenu { signOut, settings }

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;
  var _toolbarColor, _toolbarTitle;

  final List<Widget> widgetTabs = [
    ProjectsScreen(),
    TemplatesScreen(),
    SharingScreen(),
  ];
  final List<BarItem> barItems = [
    BarItem(
        text: MyStrings.tabHome,
        iconData: OMIcons.home,
        selectedIconData: Icons.home,
        color: Colors.blue),
    BarItem(
        text: MyStrings.tabTemplates,
        iconData: OMIcons.dashboard,
        selectedIconData: Icons.dashboard,
        color: Colors.green),
    BarItem(
      text: MyStrings.tabSharing,
      iconData: Icons.people_outline,
      selectedIconData: Icons.people,
      color: Colors.orange,
    )
  ];

  @override
  void initState() {
    _toolbarColor = barItems[_currentIndex].color;
    _toolbarTitle = barItems[_currentIndex].text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        right: false,
        left: false,
        top: false,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              MyToolbar(
                optionsMenu: createOptionsMenu(),
                textColor: _toolbarColor[600],
                title: _toolbarTitle,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                sliver: ChangeNotifierProvider<ProjectsModel>(
                  builder: (context) => ProjectsModel.instance(),
                  child: widgetTabs[_currentIndex],
                ),
              ),
            ],
          ),
          bottomNavigationBar: AnimatedBottomBar(
              onItemTap: (index) {
                onTabTapped(index);
              },
              startingIndex: _currentIndex,
              barItems: barItems,
              animationDuration: const Duration(milliseconds: 150)),
        ),
      ),
    );
  }

  void onMenuItemSelected(MainMenu result) async {
    switch (result) {
      case MainMenu.signOut:
        UserRepository.instance().signOut();
        break;
      case MainMenu.settings:
        Navigator.pushNamed(context, Router.settingsScreen);
        break;
    }
  }

  createOptionsMenu() {
    return PopupMenuButton<MainMenu>(
      onSelected: (MainMenu result) => onMenuItemSelected(result),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: MainMenu.signOut,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(MyStrings.menuSignOut),
            ),
          ),
          PopupMenuItem(
            value: MainMenu.settings,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(MyStrings.menuSettings),
            ),
          ),
        ];
      },
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _toolbarColor = barItems[index].color;
      _toolbarTitle = barItems[index].text;
    });
  }
}
