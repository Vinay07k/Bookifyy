class User {
  final String id;
  final String fullname;
  final String username;
  final String profilePicUrl;
  final DateTime dateJoined;
  final String instahandle;
  final List<String> followers;
  final List<String> followings;

  User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.profilePicUrl,
    required this.dateJoined,
    required this.instahandle,
    required this.followers,
    required this.followings,
  });
}
