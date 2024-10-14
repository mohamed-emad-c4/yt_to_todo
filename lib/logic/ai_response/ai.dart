import 'dart:convert';
import 'dart:developer';


import 'package:google_generative_ai/google_generative_ai.dart';

const giminiAiApiKey = "AIzaSyCLPtP-PRbk5R11EUZbpYdM1USwPRyHj5o";

class GiminiAi {
  get json => null;

  void aiResponse() async {
  final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: giminiAiApiKey,

 
// Use the data to populate your Flutter UI
  );

String totalDuration = 'N/A';
String totalVideos = ' ';
String videoDuration = 'N/A';
String videoTitle = 'N/A';
String videoUrl = 'N/A';
String timeOfDay = 'N/A';
String prompt ="""

I am a mobile app developer working on a project using the Gemini API. you are an expert with 20 years of experience in creating educational roadmaps for online teaching.

### Task:  
i want to structure a video learning plan that consists of around ${timeOfDay} of content per day from the following playlist.
Your goal is to optimize daily video time to be as close as possible to the *4-hour target.
Create a roadmap* for consuming the videos, ensuring each day's total viewing time closely matches the ${timeOfDay} mark.
After analyzing the playlist, *summarize the video's title and duration* for each day, then provide a *brief task description* to guide the learning process.

### Playlist Information:  
The playlist videos are presented in the following format:  
- *Title*: "تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي"  
- *Duration*: 5:52 (example)
- *url*: https://www.youtube.com/watch?v=xxxxxxxxxx

*Total Videos*: ${totalVideos}
*Total Duration*: ${totalDuration}

Here is the full playlist:

1. تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي (5:52) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 

---
### Instructions:  
1. Analyze the video durations and distribute them evenly across the days.  
2. Each day’s total should be approximately *4 hours*.  
3. Provide a *summary* of tasks or goals for each day based on the video content.  
4. give me the response in json format to put it directly into the database.
5. Give me the response in json format to put it directly into the database.
6. send the url of the video.
7. send me the video is belong to which day.
""" ;
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);

  String text = response.text.toString();
  
  String splittedText = text.split("```json")[1].split("```")[0];
  var decodedData = jsonDecode(splittedText);
  log (decodedData[2]["day"].toString());

}
}