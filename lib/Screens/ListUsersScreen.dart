import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import '../Providers/ProfileProvider.dart';
import 'package:bookify/constants.dart';

class ListUsersScreen extends StatelessWidget {
  final String title;
  final String onEmpty;
  final List<String>? userIds;

  const ListUsersScreen({
    Key? key,
    required this.title,
    required this.onEmpty,
    required this.userIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: userIds == null || userIds!.isEmpty
            ? Center(
                child: Text(
                  onEmpty,
                  style: KTextStyles.kAppBarTitle(Theme.of(context).focusColor)
                      .copyWith(),
                ),
              )
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
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              '132',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
}
