import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Modal Imports
import 'package:bookify/Models/Blurbuser.dart';

//Providers Imports
import 'package:bookify/Providers/Authentication.dart';
import 'package:bookify/Providers/UserProvider.dart';

//Screens Imports
import 'package:bookify/Screens/InviteContactsScreen.dart';
import 'package:bookify/Screens/Home/ProfileScreen.dart';

//Widgets Imports
import 'package:bookify/Widgets/loading.dart';

import 'package:bookify/constants.dart';

class MainDrawer extends StatefulWidget {
  // BlurbUser? _user;
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool _loading = false;
  late BlurbUser user;

  @override
  void initState() {
    super.initState();

    setState(() {
      _loading = true;
    });
    UserProvider().getCurrentUser.then((value) {
      user = value;
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(user.profilePicUrl);
    return _loading
        ? Loading()
        : Drawer(
            child: Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),

                  CircleAvatar(
                    foregroundImage: (user.profilePicUrl != null)
                        ? NetworkImage(user.profilePicUrl!)
                        : AssetImage('assets/avatar_placeholder.jpg')
                            as ImageProvider,
                    radius: 40,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.fullname,
                    style: KTextStyles.kAppBarTitle(
                      Theme.of(context).accentColor,
                      18,
                    ),
                  ),
                  Text(
                    user.username,
                    style: KTextStyles.kAppBarTitle(
                      Color.fromRGBO(196, 196, 196, 1),
                      12,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${user.followers == null ? 0 : user.followers!.length} Followers',
                          style: TextStyle(
                            letterSpacing: 0.8,
                            color: Theme.of(context).accentColor,
                            // fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${user.followings == null ? 0 : user.followings!.length} Following',
                          style: TextStyle(
                            letterSpacing: 0.8,
                            color: Theme.of(context).accentColor,
                            // fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Theme.of(context).accentColor),
                  _listItems(
                    Icons.person,
                    'View Profile',
                    context,
                    () => Navigator.of(context).pushNamed(
                      ProfileScreen.routeName,
                      arguments: {
                        'user': user,
                      },
                    ),
                  ),
                  _listItems(
                    Icons.book,
                    'About Us',
                    context,
                    () {},
                  ),
                  // _listItems(Icons.bookmark, 'Want to Reads', context, () {}),
                  _listItems(
                    Icons.favorite,
                    'Rate on Play Store',
                    context,
                    () {},
                  ),
                  _listItems(
                    Icons.adb,
                    'Report Bugs',
                    context,
                    () {},
                  ),
                  _listItems(
                    Icons.group,
                    'Invite Friends',
                    context,
                    () => Navigator.of(context)
                        .pushNamed(InviteContactsScreen.routeName),
                  ),
                  _listItems(
                    Icons.logout_outlined,
                    'Logout',
                    context,
                    () async {
                      setState(() => _loading = true);
                      await Auth().signOut;
                    },
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      "Connect with us",
                      style: KTextStyles.kSimpleText,
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
  void Function() onPressed,
) =>
    ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
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
      onTap: onPressed,
    );
