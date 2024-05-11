// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchconnect/models/channel_model.dart';
import 'package:matchconnect/models/video_model.dart';
import 'package:matchconnect/screen/category_news.dart';
import 'package:matchconnect/screen/video_screen.dart';
import 'package:matchconnect/services/youtube/api_service.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  Channel? _channel;
  bool loading = false;

  initChannel() async {
    //  ApiService channel = await ApiService.instance;
    Channel channel = await ApiService.instance
        .fetchChannel(channelId: 'UC6Dy0rQ6zDnQuHQ1EeErGUA');
    setState(() {
      _channel = channel;
    });
  }

  @override
  void initState() {
    initChannel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color(0xff000000),
        appBar: AppBar(
          backgroundColor: const Color(0xff292929),
          title: const Text('For You',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                child: Text(
                  'News',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Channels',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                  child: Text(
                    'Get sport news from round the world including Soccer,basket ball,hockey,volleyball',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text(
                  'GoTo Sport Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const CategoryNews(
                                name: 'Sports',
                              )));
                  ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  );
                },
              )
            ],
          ),
          ListView(
            children: [
              _channel != null
                  ? NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollDetails) {
                        if (!loading &&
                            _channel!.videos.length !=
                                int.parse(_channel!.videoCount) &&
                            scrollDetails.metrics.pixels ==
                                scrollDetails.metrics.maxScrollExtent) {
                          loadMoreVideos();
                        }
                        return false;
                      },
                      child: ListView.builder(
                          itemCount: 1 + _channel!.videos.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return _buildPageInfo();
                            }
                            Video video = _channel!.videos[index - 1];
                            return buildVideo(video);
                          }),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ]),
      ),
    );
  }

  _buildPageInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      height: 100,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 1), blurRadius: 6),
      ]),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              _channel!.profilePicture,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _channel!.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '${_channel!.subscriberCount} subscribers',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ))
        ],
      ),
    );
  }

  buildVideo(Video video) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => VideoScreen(id: video.id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.all(8.0),
        height: 140,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6,
          )
        ]),
        child: Row(
          children: <Widget>[
            Image(
              width: 150,
              image: NetworkImage(video.thumbnailUrl),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                video.title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadMoreVideos() async {
    loading = true;
    List<Video> moreVideo = await ApiService.instance
        .fetchVideosFromPlayList(playListId: _channel!.uploadPlayListId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideo);
    setState(() {
      _channel!.videos = allVideos;
    });
    loading = false;
  }
}
