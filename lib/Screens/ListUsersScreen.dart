import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/ProfileProvider.dart';

class ListUsersScreen extends StatelessWidget {
  final String title;
  final List<String>? userIds;

  const ListUsersScreen({
    Key? key,
    required this.title,
    required this.userIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(userIds);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: userIds == null || userIds!.isEmpty
          ? Center(child: Text('No likes yet!'))
          : FutureBuilder(
              future: ProfileProvider().getUsers(userIds!),
              builder: (context, AsyncSnapshot<List<BlurbUser>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).focusColor,
                  ));
                List<BlurbUser> users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) => ListTile(
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
                    trailing: CustomElevatedButton(
                      onPressedFunction: () {},
                      size: Size(30, 20),
                      child: Text(
                        '* 132',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
