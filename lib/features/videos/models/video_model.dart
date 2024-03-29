class VideoModel {
  VideoModel({
    required this.id,
    required this.title,
    required this.fileUrl,
    required this.description,
    required this.thumbnailUrl,
    required this.likes,
    required this.comments,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
  });
  final String id;
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final int likes;
  final int comments;
  final String creatorUid;
  final String creator;
  final int createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'fileUrl': fileUrl,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'likes': likes,
      'comments': comments,
      'creatorUid': creatorUid,
      'creator': creator,
      'createdAt': createdAt
    };
  }

  VideoModel.fromJson({
    required Map<String, dynamic> json,
    required String videoId,
  })  : id = videoId,
        title = json['title'],
        fileUrl = json['fileUrl'],
        description = json['description'],
        thumbnailUrl = json['thumbnailUrl'],
        likes = json['likes'],
        comments = json['comments'],
        creatorUid = json['creatorUid'],
        creator = json['creator'],
        createdAt = json['createdAt'];
}
