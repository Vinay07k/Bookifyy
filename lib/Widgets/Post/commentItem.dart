import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    Key? key,
    required this.commentData,
  }) : super(key: key);

  final Map<String, dynamic> commentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
              future: getUserdetails(),
              builder: (context, AsyncSnapshot<BlurbUser> snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return Loading();
                return ListTile(
                  contentPadding: const EdgeInsets.only(left: 10, right: 12),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundImage: snapshot.data!.profilePicUrl == null
                        ? AssetImage('assets/avatar_placeholder.jpg')
                        : NetworkImage(snapshot.data!.profilePicUrl!)
                            as ImageProvider,
                  ),
                  title: Text(
                    snapshot.data!.fullname,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                  subtitle: Text(
                    'Replying to ${snapshot.data!.username}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.yellow,
                    ),
                  ),
                  trailing: Text(
                    getDate(
                      commentData['createdAt'] is DateTime
                          ? commentData['createdAt']
                          : commentData['createdAt'].toDate(),
                    ),
                    style: KTextStyles.kCreatedTimeText,
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
            ),
            child: Text(
              commentData['commentText'],
              style: KTextStyles.kDescriptionText,
            ),
          ),
        ],
      ),
    );
  }

  Future<BlurbUser> getUserdetails() async {
    // setState(() => _loading = true);
    return await ProfileProvider().getUser(commentData['userId']);

    // fullname = user.fullname;
    // username = user.username;
    // profilePicUrl = user.profilePicUrl;
    // setState(() => _loading = false);
  }
}
