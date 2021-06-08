// import 'package:bookify/Models/user.dart';
// import 'package:flutter/foundation.dart';

import 'comment.dart';

class FeedModal {
  final String userId;
  final String description;
  final DateTime dateTime;
  final List<Comment> comments;
  //List of users ID
  final List<String> likes;

  const FeedModal({
    required this.userId,
    required this.description,
    required this.dateTime,
    required this.comments,
    required this.likes,
  });

  int get commentCount => this.comments.length;
  int get likesCount => this.likes.length;
}
