class Comment {
  final String userId;
  final String commentText;
  final String createdAt;

  Comment({
    required this.userId,
    required this.commentText,
    required this.createdAt,
  });

  factory Comment.fromMap(Map<String, dynamic> data) {
    return Comment(
      userId: data['userId'],
      commentText: data['commentText'],
      createdAt: data['createdAt'] == DateTime
          ? data['createdAt']
          : data['createdAt'].toDate(),
    );
  }
}
