import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:yt_to_todo/data/databases.dart';
import 'package:sqflite/sqflite.dart';

import 'package:yt_to_todo/logic/globalVaribul.dart';
import 'package:yt_to_todo/model/playList.dart';

class HelperFunction {
  final Dio _dio = Dio();

  // Fetch all videos from a playlist and their details
  Future<List<VideoInfoModel>> getAllVideosInPlaylist(String playlistId) async {
    List<VideoInfoModel> videoDetailsList = [];
    String nextPageToken = '';
    bool hasNextPage = true;

    try {
      while (hasNextPage) {
        final response = await _dio.get(
          'https://www.googleapis.com/youtube/v3/playlistItems',
          queryParameters: {
            'part': 'snippet,contentDetails',
            'playlistId': playlistId,
            'maxResults': 50,
            'pageToken': nextPageToken,
            'key': API_KEY,
          },
        );

        final data = response.data;
        await DatabaseHelper().insertVideos(
            await DatabaseHelper().database, response.data, playlistId);
        await DatabaseHelper().addPlaylistToDatabase(response.data ); // Pass the data directly

        final items = data['items'];

        for (var item in items) {
          final videoId = item['contentDetails']['videoId'];
          final title = item['snippet']['title'];
          final description = item['snippet']['description'];
          final thumbnailUrl = item['snippet']['thumbnails']['high']['url'];
          final videoUrl = 'https://www.youtube.com/watch?v=$videoId';

          final duration = await getDurationVideo(videoId);

          final videoInfo = VideoInfoModel(
            title: title,
            url: videoUrl,
            description: description,
            id: videoId,
            duration: duration,
            image: thumbnailUrl,
          );

          videoDetailsList.add(videoInfo);
        }

        nextPageToken = data['nextPageToken'] ?? '';
        hasNextPage = nextPageToken.isNotEmpty;
      }

      log('Total videos fetched: ${videoDetailsList.length}');
    } catch (e) {
      log('Error fetching playlist videos: $e');
    }

    return videoDetailsList;
  }

  Future<List<String?>> getPlaylistTitle(String playlistId) async {
    final url =
        'https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=$playlistId&key=$API_KEY';
    List<String?> retun = [];
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        // تحقق مما إذا كانت قائمة التشغيل موجودة
        if (data['items'] != null && data['items'].isNotEmpty) {
          retun.add(data['items'][0]['snippet']['title']);
          retun.add(data['items'][0]['snippet']['description']);
          retun.add(data['items'][0]['snippet']['thumbnails']['high']['url']);
          // استرجاع عنوان قائمة التشغيل
          return retun;
        } else {
          print(
              'No items found in the response. Please check the playlist ID.');
          return [];
        }
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Request failed with error: $e');
      return [];
    }
  }

  // Fetch video duration by ID
  Future<String> getDurationVideo(String videoId) async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/youtube/v3/videos',
        queryParameters: {
          'part': 'contentDetails',
          'id': videoId,
          'key': API_KEY,
        },
      );

      final duration = response.data['items'][0]['contentDetails']['duration'];

      return extractDuration(duration);
    } catch (e) {
      log('Error fetching video duration: $e');
      return 'N/A';
    }
  }

  // Helper function to format duration from ISO 8601
  String extractDuration(String duration) {
    final regex = RegExp(r'PT(\d+H)?(\d+M)?(\d+S)?');
    final match = regex.firstMatch(duration);

    if (match != null) {
      final hours = match.group(1) != null
          ? int.parse(match.group(1)!.replaceAll('H', ''))
          : 0;
      final minutes = match.group(2) != null
          ? int.parse(match.group(2)!.replaceAll('M', ''))
          : 0;
      final seconds = match.group(3) != null
          ? int.parse(match.group(3)!.replaceAll('S', ''))
          : 0;

      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }

    return 'N/A';
  }

  // Calculate total time from a list of video durations
  String sumTotalTime(List<VideoInfoModel> videoList) {
    int totalSeconds = 0;

    for (var video in videoList) {
      final durationParts = video.duration.split(':');
      if (durationParts.length == 3) {
        final hours = int.parse(durationParts[0]);
        final minutes = int.parse(durationParts[1]);
        final seconds = int.parse(durationParts[2]);

        totalSeconds += (hours * 3600) + (minutes * 60) + seconds;
      }
    }

    final totalHours = totalSeconds ~/ 3600;
    totalSeconds %= 3600;
    final totalMinutes = totalSeconds ~/ 60;
    totalSeconds %= 60;

    log('Total time: ${totalHours.toString().padLeft(2, '0')}:${totalMinutes.toString().padLeft(2, '0')}:${totalSeconds.toString().padLeft(2, '0')}');

    return '${totalHours.toString().padLeft(2, '0')}:${totalMinutes.toString().padLeft(2, '0')}:${totalSeconds.toString().padLeft(2, '0')}';
  }
}