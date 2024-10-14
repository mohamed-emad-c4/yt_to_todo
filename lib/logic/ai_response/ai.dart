import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../../data/databases.dart';
import '../helper.dart';

const String giminiAiApiKey = "AIzaSyCLPtP-PRbk5R11EUZbpYdM1USwPRyHj5o";

class GiminiAi {
  List<Map<String, dynamic>> playlistInfo = [];
  List<Map<String, dynamic>> allInfoPlaylist = [];

  Future<void> aiResponse(String timeOfDay, String playlistId) async {
    try {
      // Fetch playlist information from the database
      playlistInfo = await DatabaseHelper().getPlaylistById(playlistId);
      if (playlistInfo.isEmpty) {
        log("Playlist not found in the database.");
        return;
      }

      // Fetch all videos in the playlist from the database
      allInfoPlaylist = await HelperFunction().getALLVideosINPlaylistIfoFromDB(playlistId);
      if (allInfoPlaylist.isEmpty) {
        log("No videos found in the playlist.");
        return;
      }

      // Construct the list of videos with their titles and durations
      String allVideos = "";
      int videoIndex = 1;
      for (var video in allInfoPlaylist) {
        allVideos += "$videoIndex. ${video['video_tittle']}, ${video["video_duration"]} \n";
        videoIndex++;
      }

      // Initialize the generative model
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: giminiAiApiKey,
      );

      // Extract total time and total videos from the playlist info
      String totalTime = playlistInfo[0]['playlist_total_time'];
      String totalVideos = playlistInfo[0]["playlist_total_videos"];

      // Construct the prompt for the generative AI
      String prompt = """
I am a mobile app developer working on a project using the Gemini API. You are an expert with 20 years of experience in creating educational roadmaps for online teaching.

### Task:  
I want to structure a video learning plan that consists of around $timeOfDay of content per day from the following playlist.
Your goal is to optimize daily video time to be as close as possible to the *4-hour target*.
Create a roadmap for consuming the videos, ensuring each day's total viewing time closely matches the $timeOfDay mark.
After analyzing the playlist, *summarize the video's title and duration* for each day, then provide a *brief task description* to guide the learning process.

### Playlist Information:  
The playlist videos are presented in the following format:  
- *Title*: "تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي"  
- *Duration*: 5:52 (example)
- *url*: https://www.youtube.com/watch?v=xxxxxxxxxx

*Total Videos*: $totalVideos
*Total Duration*: $totalTime

Here is the full playlist:

$allVideos
---
### Instructions:  
1. Analyze the video durations and distribute them evenly across the days.  
2. Each day’s total should be approximately $timeOfDay hours.  
3. Provide a *summary* of tasks or goals for each day based on the video content.  
4. Give me the response in JSON format to put it directly into the database.
5. Include the URL of the video.
6. Specify which day the video belongs to.
""";

      // Generate content using the generative model
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      // Extract and parse the JSON response
      String text = response.text.toString();

      // Validate and extract JSON part
      String jsonPart = extractJsonPart(text);
      if (jsonPart.isEmpty) {
        log("Failed to extract JSON part from the response. Full response: $text");
        return;
      }

      var decodedData = jsonDecode(jsonPart);

      // Log the decoded data for debugging
      log(decodedData[2]["day"].toString());
      log(prompt);

    } catch (e) {
      log("Error in aiResponse: $e");
    }
  }

  String extractJsonPart(String text) {
    final jsonPattern1 = RegExp(r'```json([\s\S]*?)```');
    final jsonPattern2 = RegExp(r'\{[\s\S]*\}');

    // Try to match the first pattern
    var match = jsonPattern1.firstMatch(text);
    if (match != null && match.groupCount > 0) {
      return match.group(1)!.trim();
    }

    // Fallback to the second pattern
    match = jsonPattern2.firstMatch(text);
    if (match != null && match.groupCount > 0) {
      return match.group(0)!.trim();
    }

    return "";
  }
}