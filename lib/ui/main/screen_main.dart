import 'package:decisive/resources/strings.dart';
import 'package:decisive/ui/common/widget_animated_bottom_bar.dart';
import 'package:decisive/ui/projects/screen_projects.dart';
import 'package:decisive/ui/sharing/screen_sharing.dart';
import 'package:decisive/ui/templates/screen_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../../router.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

enum MainMenu { signOut, settings }

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
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
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: _toolbarColor,
            centerTitle: true,
            title: Text(
              _toolbarTitle,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            actions: <Widget>[createOptionsMenu()],
          ),
          body: widgetTabs[_currentIndex],
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
        Navigator.pushReplacementNamed(context, Router.loginScreen);
        break;
      case MainMenu.settings:
        await Navigator.pushNamed(context, Router.settingsScreen).then((_) {
          setStatusBarColor();
        });
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

  setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: barItems[_currentIndex].color.shade700));
  }

  void onTabTapped(int index) {
    setState(() {
      setStatusBarColor();
      _currentIndex = index;
      _toolbarColor = barItems[index].color;
      _toolbarTitle = barItems[index].text;
    });
  }
}
