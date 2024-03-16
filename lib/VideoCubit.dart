import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/widgets/CustomToast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_data_api/models/video_data.dart';
import 'package:youtube_data_api/youtube_data_api.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube/youtube.dart';

class VideoCubit extends Cubit<List<List<VideoInfo>>> {
  VideoCubit() : super([]);

  List<List<String>> allVideoIds = [
    ['-i1uF3pa0oI'],
    [
      'MTz2ZiIbhBQ',
      'uWdn0cL4HHQ',
      'OSNHiAjxeWM',
      'xqb4avsCels',
    ],
    ['GoYCQ1lic5c', 'V-I11RKtAdI'],
    ['sBmBqQTzE6Q', 'dAu6S-4LxY4', '66JptmpWZ5s', '3rZ1_9sHZ8Q'],
    ['vvGdDEgwXWw', 'QNcGhBE4V3o'],
    ['kZIShYdmoc8','a_qhi6bk2nI'],
    ['9XBn9vs0_7g', 'EdHJLrZQEe0', 'HpE4fbLIMJI'],
    ['mrMRgiUkhpE'],
    ['Pnx9bsSUY5Q', '82QqMg5rd3o', 'X5ODcKdD_c0'],
    ['qDHkEJ6aC2k', 'UT7Z7BFwJhI'],
    ['LpVTKLKgEkc', 'F4n7Y7le8p0', 'soWEDjdOGcg', 'Zy3xB0YL6dQ'],
    ['CbLCMzpd0xQ', 'mMsmc_oTcio'],
    ['M545AXszHTE', 'B42lz0fWHQ8']
  ];

  Future<void> launchURL(VideoInfo videoInfo,int index,int subindex) async {
    Uri url = Uri.parse('https://www.youtube.com/watch?v=${allVideoIds[index][subindex]}');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> fetchVideoInfo() async {
    try {
      List<List<VideoInfo>> videoInfos = [];
      Youtube youtube = Youtube();
      for (List<String> videosIds in allVideoIds) {
        List<VideoInfo> myVideos = [];
        for (String videoId in videosIds) {
          await youtube.video(videoId); // Fetch video details
          String videoTitle = youtube.title() ?? 'Default Title'; // Get video title
          String thumbnail = await getYoutubeThumbnail(videoId);
          myVideos.add(VideoInfo(title: videoTitle, thumbnail: thumbnail));
        }
        videoInfos.add(myVideos);
      }
      emit(videoInfos);
    } catch (e) {
      showToast(message: 'Error fetching videos. Try again later');
      emit([]); // Reset state if an error occurs
    }
  }

  Future<String> getYoutubeThumbnail(String videoId) async {
    try {
      return YoutubeThumbnail(youtubeId: videoId).hq();
    } catch (e) {
      print('Error fetching video thumbnail: $e');
      return '';
    }
  }
}

class VideoInfo {
  final String title;
  final String thumbnail;

  VideoInfo({required this.title, required this.thumbnail});
}
