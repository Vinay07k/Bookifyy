import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/list_users_item.dart';
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
                  return ListUsersItem(users: users);
                }),
      );
}
