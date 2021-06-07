import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Color(0xFF111111),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 180,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bookify",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              _listItems(Icons.person, 'View Profile'),
              _listItems(Icons.book, 'About Us'),
              _listItems(Icons.bookmark, 'Want to Reads'),
              _listItems(Icons.favorite, 'Rate on Play Store'),
              _listItems(Icons.adb, 'Report Bugs'),
              _listItems(Icons.group, 'Invite Friends'),
              _listItems(Icons.group, 'Invite Friends'),
              SizedBox(height: 120),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Connect with us",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _iconButton(FaIcon(FontAwesomeIcons.linkedin), context),
                  _iconButton(FaIcon(FontAwesomeIcons.instagram), context),
                  _iconButton(FaIcon(FontAwesomeIcons.twitter), context),
                  _iconButton(FaIcon(FontAwesomeIcons.globe), context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _iconButton(Widget icon, BuildContext context) => Padding(
      padding: const EdgeInsets.all(6),
      child: IconButton(
        iconSize: 25,
        icon: icon,
        color: Color(0xffffff00),
        onPressed: () {},
      ),
    );

Widget _listItems(IconData icon, String title) => ListTile(
      contentPadding: const EdgeInsets.only(left: 30),
      leading: Icon(
        icon,
        color: Color(0xFFC4C4C4),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      onTap: () {},
    );
