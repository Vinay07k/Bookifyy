// import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Screens/ListUsersScreen.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionBox extends StatelessWidget {
  final String fullname;
  final String username;
  final String? bio;
  final String? profilePicUrl;
  final DateTime dateJoined;
  final String? instahandle;
  final List<String>? followers;
  final List<String>? following;

  const DescriptionBox(
      {Key? key,
      required this.fullname,
      required this.username,
      required this.bio,
      required this.dateJoined,
      required this.instahandle,
      required this.followers,
      required this.following,
      required this.profilePicUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 40,
                  foregroundImage: NetworkImage(
                    profilePicUrl ??
                        'https://wallpaperaccess.com/full/6186864.jpg',
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullname,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ListUsersScreen(
                                onEmpty: 'No Followers yet!',
                                title: 'Followers',
                                userIds: followers,
                              ),
                            ),
                          ),
                          child: Text(
                            '${followers != null ? followers!.length : 0} Followers',
                            style: TextStyle(
                              letterSpacing: 0.8,
                              color: Theme.of(context).accentColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ListUsersScreen(
                                onEmpty: 'No Followings yet!',
                                title: 'Followings',
                                userIds: following,
                              ),
                            ),
                          ),
                          child: Text(
                            '${following != null ? following!.length : 0} Following',
                            style: TextStyle(
                              letterSpacing: 0.8,
                              color: Theme.of(context).accentColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            (bio == null || bio!.isEmpty) ? 'No bio Added' : bio!,
            style: KTextStyles.kDescriptionText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.book,
                color: Theme.of(context).focusColor,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                monthlyDate(dateJoined),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  // fontSize: 16,
                ),
              ),
              const SizedBox(width: 12),
              if (instahandle != null && instahandle!.isNotEmpty)
                Icon(
                  Icons.link,
                  color: Theme.of(context).focusColor,
                  size: 22,
                ),
              const SizedBox(width: 8),
              if (instahandle != null && instahandle!.isNotEmpty)
                Expanded(
                  child: GestureDetector(
                    onTap: openInstagramLink,
                    child: Text(
                      instahandle!,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        // fontSize: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 15),
          // Divider(
          //   color: Theme.of(context).accentColor,
          //   height: 25,
          // ),
        ],
      ),
    );
  }

  void openInstagramLink() async => await canLaunch(instahandle!)
      ? await launch(instahandle!)
      : throw 'Could not launch $instahandle!';
}

String monthlyDate(DateTime date) {
  Map<int, String> months = {
    1: 'Jan',
    2: 'Feb',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'Aug',
    9: 'Sept',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  return 'Joined ${months[date.month]} ${date.year}';
}
