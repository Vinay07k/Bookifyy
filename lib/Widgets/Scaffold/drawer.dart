import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bookify/sizeconfig.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF111111),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: getRelativeHeight(0.26),
              child: Center(
                child: const Text(
                  "Bookify",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            _listItems(Icons.person, 'View Profile', context),
            _listItems(Icons.book, 'About Us', context),
            _listItems(Icons.bookmark, 'Want to Reads', context),
            _listItems(Icons.favorite, 'Rate on Play Store', context),
            _listItems(Icons.adb, 'Report Bugs', context),
            _listItems(Icons.group, 'Invite Friends', context),
            SizedBox(height: getRelativeHeight(0.13)),
            const Text(
              "Connect with us",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),
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
    );
  }
}

Widget _iconButton(
  Widget icon,
  BuildContext context,
) =>
    Padding(
      padding: const EdgeInsets.all(4),
      child: IconButton(
        iconSize: 30,
        icon: icon,
        color: Theme.of(context).focusColor,
        onPressed: () {},
      ),
    );

Widget _listItems(
  IconData icon,
  String title,
  BuildContext context,
) =>
    ListTile(
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
          color: Theme.of(context).accentColor,
        ),
      ),
      onTap: () {},
    );
