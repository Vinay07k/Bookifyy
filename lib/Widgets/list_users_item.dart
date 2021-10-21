import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Screens/Home/ProfileScreen.dart';
import 'package:flutter/material.dart';

import 'blurb_count_widget.dart';

class ListUsersItem extends StatelessWidget {
  const ListUsersItem({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<BlurbUser> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.of(context).pushNamed(ProfileScreen.routeName,
            arguments: {'user': users[index]}),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            users[index].profilePicUrl ??
                'https://wallpaperaccess.com/full/6186864.jpg',
          ),
        ),
        title: Text(
          users[index].fullname,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        subtitle: Text(
          users[index].username,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        trailing: BlurbCountWidget(blurbCount: users[index].blurbCount),
      ),
    );
  }
}
