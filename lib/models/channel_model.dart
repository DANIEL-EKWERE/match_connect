import 'package:matchconnect/models/video_model.dart';

class Channel {
  final String id;
  final String title;
  final String profilePicture;
  final String subscriberCount;
  final String videoCount;
  final String uploadPlayListId;
  List<Video> videos;

  Channel(
      {required this.id,
      required this.title,
      required this.profilePicture,
      required this.subscriberCount,
      required this.videoCount,
      required this.uploadPlayListId,
      required this.videos});

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
        id: map['id'],
        title: map['snippet']['title'],
        profilePicture: map['snippet']['thumbnails']['default']['profilePicture'],
        subscriberCount: map['statistics']['subscriberCount'],
        videoCount: map['statistics']['videoCount'],
        uploadPlayListId: map['contentDetails']['relatedPlayLists']['uploads'],
        videos: map['videos']);
  }
}
