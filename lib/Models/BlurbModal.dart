import 'package:cloud_firestore/cloud_firestore.dart';

import 'comment.dart';
import 'package:intl/intl.dart';

class BlurbItemModal {
  /// Users Id can be used to fetch [BlurbUser]'s detail
  final String userId;

  ///Main text of the [BlurbItem]
  final String content;

  ///Time when the [BlurbItem] is created
  final DateTime createdAt;

  ///List of [Comment] items of the Blurb
  final List<Comment>? comments;

  ///List of [BlurbUser]'s which liked the Blurb
  final List<String>? likes;

  const BlurbItemModal({
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.comments,
    required this.likes,
  });

  int? get commentCount => this.comments?.length;
  int? get likesCount => this.likes?.length;
  String get createdTime => DateFormat('hh:mm').format(this.createdAt);
  String get createdDate => DateFormat('dd-MMMM-yyyy').format(this.createdAt);

  factory BlurbItemModal.fromMap(mappedData) {
    // Timestamp data =  mappedData['createdAt'];
    // print(data.toDate());
    return BlurbItemModal(
      userId: mappedData['userId'],
      content: mappedData['content'],
      createdAt: mappedData['createdAt'].toDate(),
      comments: mappedData['comments'],
      likes: mappedData['likes'],
    );
  }
}
