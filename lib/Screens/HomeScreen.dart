import 'package:flutter/material.dart';

import '../Widgets/Scaffold/appbar.dart';

enum TABS {
  FEEDS,
  BOOKS,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        drawer: Drawer(),
        body: Center(
          child: _currentTab == TABS.BOOKS
              ? Text(
                  'Books',
                  style: TextStyle(color: Colors.white),
                )
              : Center(
                  child: Container(
                    width: 280,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome to Bookify family! \n Your friends didn’t post their any Blurb yet, be the first one and add more friends.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add Firends',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
