class BlurbUser {
  final String id;
  final String fullname;
  final String username;
  final DateTime dateJoined;
  final String? bio;
  final String? profilePicUrl;
  final String? instahandle;
  final List<String>? followers;
  final List<String>? followings;

  BlurbUser({
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
}
