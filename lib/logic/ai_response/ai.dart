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
      log("started aiResponse");
      // Fetch playlist information from the database
      playlistInfo = await DatabaseHelper().getPlaylistById(playlistId);
      if (playlistInfo.isEmpty) {
        log("Playlist not found in the database.");
        return;
      }

      // Fetch all videos in the playlist from the database
      allInfoPlaylist =
          await HelperFunction().getALLVideosINPlaylistIfoFromDB(playlistId);
      if (allInfoPlaylist.isEmpty) {
        log("No videos found in the playlist.");
        return;
      }

      // Construct the list of videos with their titles and durations
      String allVideos = "";
      int videoIndex = 1;
      for (var video in allInfoPlaylist) {
        allVideos +=
            "$videoIndex. ${video['video_tittle']}, ${video["video_duration"]} ${video["video_url"]} \n";
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
Your prompt can be improved by enhancing clarity, making the structure more readable, and ensuring that it efficiently guides the model toward the desired outcome. Here’s the refined version of your original prompt:

Role:
I am a mobile app developer working on a project using the Gemini API. You are an expert with 20 years of experience in creating educational roadmaps for online teaching.

Task:
I need you to  Create a **7-day roadmap* for consuming the videos, ensuring each day's total viewing time closely matches $timeOfDay hours of video content per day. You will:

1. Analyze the playlist's total video duration and divide it evenly across $timeOfDay daily sessions.
2. Provide a roadmap that ensures each day's total viewing time is as close as possible to $timeOfDay hours.
3. For each day, summarize the videos' title, duration, and URL, along with a brief description of tasks or learning goals related to the content.

Playlist Information:
The playlist includes the following details:

Title: "تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي"
Duration: 5:52 (example)
URL: https://www.youtube.com/watch?v=xxxxxxxxxx
Total Videos: $totalVideos
Total Duration: $totalTime
Here is the full playlist:
$allVideos

Instructions:
1. Distribute the videos evenly over the days to closely match the $timeOfDay hours target.
2. Summarize the key information for each day's videos (title, duration, URL).
3. Provide a brief learning task or goal description for each day based on the video content.
4. Return the response in JSON format, formatted to be directly inserted into a database.
5. Specify which day each video belongs to.
6. Ensure that each video’s URL is returned in the format: "https://www.youtube.com/watch?v=xxxxxxxxxx".

Example Response (JSON Format):

[
  {
    "day": 1,
    "videos": [
      {
        "title": "Introduction to HTML",
        "duration": "5:52",
        "url": "https://www.youtube.com/watch?v=xxxxxxxxxx"
      },
      {
        "title": "HTML Tags",
        "duration": "10:23",
        "url": "https://www.youtube.com/watch?v=xxxxxxxxxx"
      }
    ],
    "total_duration": "1:00:00",
    "learning_task": "Understand basic HTML structure and essential tags."
  },
  {
    "day": 2,
    "videos": [
      {
        "title": "CSS Basics",
        "duration": "15:45",
        "url": "https://www.youtube.com/watch?v=xxxxxxxxxx"
      }
    ],
    "total_duration": "1:00:00",
    "learning_task": "Learn to style HTML using CSS."
  }
]

Key Enhancements:
- Clearer task segmentation, making it easier for the model to follow the instructions.
- Enhanced structure of the JSON response, ensuring each element is clearly defined.
- Focused goal on dividing content per day while staying close to the time target, with added learning task suggestions.

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
      log(decodedData.toString());
      // log(prompt);
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
