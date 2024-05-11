import 'dart:convert';
import 'dart:io';

import 'package:matchconnect/models/channel_model.dart';
import 'package:matchconnect/models/video_model.dart';
import 'package:http/http.dart' as http;
import 'package:matchconnect/services/utilites/keys.dart';

class ApiService {
  ApiService._instantiate();

  static final ApiService instance = ApiService._instantiate();

  final String baseUrl = 'www.googleapis.com';
  String nextPageToken = '';

 // ApiService get instance => null;

  Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet , contenDetails ,statistics',
      'id': channelId,
      'keys': API_KEY,
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/channels', parameters);
    Map<String, String> hearders = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    var response = await http.get(uri, headers: hearders);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      Channel channel = Channel.fromMap(data);

      channel.videos =
          await fetchVideosFromPlayList(playListId: channel.uploadPlayListId);
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlayList(
      {required String playListId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'id': playListId,
      'maxResults': '8',
      'pageToken': nextPageToken,
      'keys': API_KEY,
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItem', parameters);
    Map<String, String> hearders = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var response = await http.get(uri, headers: hearders);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];
      // Channel channel = Channel.fromMap(data);

      List<Video> videos = [];
      videosJson.forEach(
        (element) {
          videos.add(Video.fromMap(element['snippet']));
        },
      );

      // channel.videos =
      //     await fetchVideosFromPlayList(playListId: channel.uploadPlayListId);
      // return channel;
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}
