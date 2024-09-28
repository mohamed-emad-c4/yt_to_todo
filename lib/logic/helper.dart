import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:yt_to_todo/logic/globalVaribul.dart';

String allDuration = "";
List<int> allDurationList = [];
int hours = 0;
int minutes = 0;
int seconds = 0;

class HelperFuncation {
  final dio = Dio();

  Future<String> getDurationVideo(String idVideo) async {
    try {
      final request = await dio.get(
          'https://www.googleapis.com/youtube/v3/videos?part=id%2Csnippet%2CcontentDetails&id=$idVideo&key=$API_KEY');
      allDuration =
          await request.data["items"][0]["contentDetails"]["duration"];
      final regex = RegExp(r'PT(\d+H)?(\d+M)?(\d+S)?');
      final match = regex.firstMatch(allDuration);

      if (match != null) {
        hours = match.group(1) != null
            ? int.parse(match.group(1)!.replaceAll('H', ''))
            : 0;
        minutes = match.group(2) != null
            ? int.parse(match.group(2)!.replaceAll('M', ''))
            : 0;
        seconds = match.group(3) != null
            ? int.parse(match.group(3)!.replaceAll('S', ''))
            : 0;

        allDurationList = [hours, minutes, seconds];
      } else {
        log("Failed to parse duration");
      }
    } catch (e) {
      log("Error fetching video data: $e");
    }
    return "Hours: $hours, Minutes: $minutes, Seconds: $seconds";
  }


  
}
