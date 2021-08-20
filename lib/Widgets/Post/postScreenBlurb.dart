import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class PostScreenBlurb extends StatefulWidget {
  const PostScreenBlurb(this._blurb, {Key? key}) : super(key: key);

  final BlurbItemModal _blurb;

  @override
  _PostScreenBlurbState createState() => _PostScreenBlurbState();
}

class _PostScreenBlurbState extends State<PostScreenBlurb> {
  bool _loading = false;

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
                  onTap: () {},
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
                    '${getDate()}',
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
                ),
                // Text(
                //   '42 Likes',
                //   textAlign: TextAlign.start,
                //   style: TextStyle(color: Colors.white),
                // ),
                // Divider(
                //   color: Colors.white,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).focusColor),
                      ),
                      icon: Icon(Icons.favorite),
                      label: Text('${widget._blurb.likesCount ?? 0}'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      icon: Icon(Icons.comment_outlined),
                      label: Text('${widget._blurb.commentCount ?? 0}'),
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
    final BlurbUser user =
        await ProfileProvider().getUser(widget._blurb.userId);

    fullname = user.fullname;
    username = user.username;
    profilePicUrl = user.profilePicUrl;
    setState(() => _loading = false);
  }

  String getDate() {
    Duration date =
        ((widget._blurb.createdAt.difference(DateTime.now()))).abs();
    if (date.inMinutes <= 60)
      return (date.inMinutes < 2
              ? '${date.inMinutes} min'
              : '${date.inMinutes} mins') +
          ' ago';
    if (date.inHours <= 24)
      return (date.inHours < 2 ? '${date.inHours} hr' : '${date.inHours} hrs') +
          ' ago';
    if (date.inDays <= 7)
      return (date.inDays < 2 ? '${date.inDays} day' : '${date.inDays} days') +
          ' ago';
    return DateFormat('dd-MM-yy').format(widget._blurb.createdAt).toString();
  }
}
