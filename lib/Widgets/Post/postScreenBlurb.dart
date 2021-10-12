import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:bookify/Screens/Home/ProfileScreen.dart';
import 'package:bookify/Screens/ListUsersScreen.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PostScreenBlurb extends StatefulWidget {
  const PostScreenBlurb(this._blurb, {Key? key}) : super(key: key);

  final BlurbItemModal _blurb;

  @override
  _PostScreenBlurbState createState() => _PostScreenBlurbState();
}

class _PostScreenBlurbState extends State<PostScreenBlurb> {
  bool _loading = false;

  late final BlurbUser user;

  late String fullname;
  late String username;
  String? profilePicUrl;

  @override
  void initState() {
    super.initState();
    getUserdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        // vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(23, 23, 23, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _loading
              ? Loading()
              : ListTile(
                  onTap: () async {
                    setState(() {
                      _loading = true;
                    });
                    // BlurbUser user =
                    //     await ProfileProvider().getUser(widget._blurb.userId);
                    Navigator.of(context).pushNamed(
                      ProfileScreen.routeName,
                      arguments: {'user': user},
                    );
                    setState(() {
                      _loading = false;
                    });
                  },
                  contentPadding: EdgeInsets.only(left: 10, right: 14),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundImage: profilePicUrl == null
                        ? AssetImage('assets/avatar_placeholder.jpg')
                        : NetworkImage(profilePicUrl!) as ImageProvider,
                  ),
                  title: Text(
                    fullname,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                  subtitle: Text(
                    username,
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '${getDate(widget._blurb.createdAt)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget._blurb.content,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ListUsersScreen(
                            title: 'Liked By',
                            userIds: widget._blurb.likes,
                          ),
                        ),
                      ),
                      child: Text(
                        '${widget._blurb.likesCount ?? 0} likes',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '${widget._blurb.commentCount ?? 0} comments',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      // style: ButtonStyle(
                      //   foregroundColor: MaterialStateProperty.all(
                      //       Theme.of(context).focusColor),
                      // ),
                      icon: Icon(
                        Icons.favorite,
                      ),
                      color: Theme.of(context).focusColor,
                      // label: Text('${widget._blurb.likesCount ?? 0}'),
                    ),
                    IconButton(
                      onPressed: () {},
                      // style: ButtonStyle(
                      //   foregroundColor:
                      //       MaterialStateProperty.all(Colors.white),
                      // ),
                      icon: Icon(Icons.comment_outlined),
                      color: Theme.of(context).accentColor,
                      // label: Text('${widget._blurb.commentCount ?? 0}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        child: Icon(
                          Icons.share_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                        onTap: () {
                          Share.share(
                            'Hey There! I found this awesome platform for wonks to share your feedbacks and learnings. Make sure to check it out! - *Our PlayStore Link*',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getUserdetails() async {
    setState(() => _loading = true);
    user = await ProfileProvider().getUser(widget._blurb.userId);

    fullname = user.fullname;
    username = user.username;
    profilePicUrl = user.profilePicUrl;
    setState(() => _loading = false);
  }
}
