import 'comment.dart';
import 'package:intl/intl.dart';

class BlurbItemModal {
  final String blurbId;

  /// Users Id can be used to fetch [BlurbUser]'s detail
  final String userId;

  ///Main text of the [BlurbItem]
  final String content;

  ///Time when the [BlurbItem] is created
  final DateTime createdAt;

  ///List of [Comment] items of the Blurb
  List<Map>? comments;

  ///List of [BlurbUser]'s ID which liked the Blurb
  List<String>? likes;

  BlurbItemModal({
    required this.blurbId,
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

  // set updateLike(List<String> likes) => this.likes = likes;

  factory BlurbItemModal.fromMap(mappedData) {
    // var data = mappedData['comments'];
    print(mappedData.id);
    return BlurbItemModal(
      blurbId: mappedData.id,
      userId: mappedData['userId'],
      content: mappedData['content'],
      createdAt: mappedData['createdAt'].toDate(),
      comments: mappedData['comments'] == null
          ? null
          : List.from(mappedData['comments']),
      likes:
          mappedData['likes'] == null ? null : List.from(mappedData['likes']),
    );
  }
}
