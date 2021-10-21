class BlurbUser {
  final String id;
  final String fullname;
  final String username;
  final DateTime dateJoined;
  final String? bio;
  int blurbCount;
  final String? profilePicUrl;
  final String? instahandle;
  List<String>? followers;
  List<String>? followings;

  BlurbUser({
    required this.blurbCount,
    required this.id,
    required this.fullname,
    required this.username,
    required this.bio,
    required this.profilePicUrl,
    required this.dateJoined,
    required this.instahandle,
    required this.followers,
    required this.followings,
  });

  factory BlurbUser.mapToBlurbUser(Map mappedUserData) {
    // print(mappedUserData);
    return BlurbUser(
      id: mappedUserData['uid'] ?? '',
      blurbCount: mappedUserData['blurb_count'],
      fullname: mappedUserData['fullname'],
      username: mappedUserData['username'],
      dateJoined: mappedUserData['createdAt'].toDate(),
      bio: mappedUserData['bio'],
      profilePicUrl: mappedUserData['profilePicUrl'],
      followers: mappedUserData['followers'] == null
          ? null
          : List.from(mappedUserData['followers']),
      followings: mappedUserData['followings'] == null
          ? null
          : List.from(mappedUserData['followings']),
      instahandle: mappedUserData['instahandle'],
    );
  }
}
