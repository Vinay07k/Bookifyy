import 'package:bookify/Screens/FeedsScreen.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Widgets/Scaffold/appbar.dart';
import 'package:bookify/Widgets/Scaffold/drawer.dart';

enum TABS {
  FEEDS,
  BOOKS,
}

class ScreenController extends StatefulWidget {
  final routeName = '/screen-controller';
  const ScreenController({Key? key}) : super(key: key);

  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  TABS _currentTab = TABS.FEEDS;

  void _switchTabs(TABS tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: KAppBar(_switchTabs, _currentTab),
        drawer: MainDrawer(),
        body: _currentTab == TABS.BOOKS
            ? const Text(
                'Books',
                style: TextStyle(color: Colors.white),
              )
            : FeedsScreen(),
        floatingActionButton: _currentTab == TABS.BOOKS
            ? null
            : FloatingActionButton(
                backgroundColor: Theme.of(context).focusColor,
                tooltip: 'Add Blurb',
                child: Icon(
                  Icons.add_to_home_screen,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
      ),
    );
  }
}