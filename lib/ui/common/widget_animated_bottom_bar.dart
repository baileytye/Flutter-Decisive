import 'package:decisive/resources/colors.dart';
import 'package:flutter/material.dart';

const double selectedBackgroundOpacity = 0.15;

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final int startingIndex;
  final Duration animationDuration;
  final Function onItemTap;

  AnimatedBottomBar(
      {@required this.barItems,
      @required this.onItemTap,
      this.startingIndex = 0,
      this.animationDuration = const Duration(milliseconds: 500)});

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.startingIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MyColors.cardStroke.withOpacity(0.1),
          ),
        ),
      ),
      child: Material(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
            top: 8,
            left: 8,
            right: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildBarItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      var item = widget.barItems[i];
      bool isSelected = selectedIndex == i;
      _barItems.add(
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedIndex = i;
              widget.onItemTap(i);
            });
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
                color: isSelected
                    ? item.color.withOpacity(selectedBackgroundOpacity)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: <Widget>[
                Icon(
                  isSelected ? item.selectedIconData : item.iconData,
                  color: isSelected ? item.color : Colors.black54,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                AnimatedSize(
                  curve: Curves.easeIn,
                  duration: widget.animationDuration,
                  vsync: this,
                  child: Text(
                    isSelected ? item.text : '',
                    style: TextStyle(
                      color: item.color,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}

class BarItem {
  String text;
  IconData iconData, selectedIconData;
  MaterialColor color;

  BarItem({this.text, this.iconData, this.selectedIconData, this.color});
}
