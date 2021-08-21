import 'package:bookify/Models/BlurbModal.dart';
import 'package:bookify/Models/Blurbuser.dart';
import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:bookify/Providers/ProfileProvider.dart';
import 'package:bookify/Widgets/loading.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Screens/Home/BlurbDetailScreen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BlurbItem extends StatefulWidget {
  const BlurbItem(this._blurb, {Key? key}) : super(key: key);

  final BlurbItemModal _blurb;

  @override
  _BlurbItemState createState() => _BlurbItemState();
}

class _BlurbItemState extends State<BlurbItem> {
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
    BlurbProvider _blurbProvider = Provider.of<BlurbProvider>(context);
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
          _loading
              ? Loading()
              : ListTile(
                  onTap: () {},
                  contentPadding: const EdgeInsets.only(left: 10, right: 14),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundImage: profilePicUrl == null
                        ? AssetImage('assets/avatar_placeholder.jpg')
                        : NetworkImage(profilePicUrl!) as ImageProvider,
                  ),
                  title: Text(
                    fullname,
                    style: KTextStyles.kNameText,
                  ),
                  subtitle: Text(
                    username,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '${getDate()}',
                    style: KTextStyles.kCreatedTimeText,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(
              left: 60,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    BlurbScreen().routeName,
                    arguments: widget._blurb,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      widget._blurb.content,
                      textAlign: TextAlign.start,
                      style: KTextStyles.kDescriptionText,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Like and Like count button
                    TextButton.icon(
                      onPressed: () async {
                        await _blurbProvider.toggleLike(
                          blurb: widget._blurb,
                          userId: ProfileProvider().currentuserId,
                        );
                        setState(() {});
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).focusColor),
                      ),
                      icon: Icon(widget._blurb.likes != null &&
                              (widget._blurb.likes!
                                  .contains(ProfileProvider().currentuserId))
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                      label: Text('${widget._blurb.likesCount ?? 0}'),
                    ),

                    ///Comment and Comment count button
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).accentColor),
                      ),
                      icon: const Icon(Icons.comment_outlined),
                      label: Text('${widget._blurb.commentCount ?? 0}'),
                    ),

                    ///Share button
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
