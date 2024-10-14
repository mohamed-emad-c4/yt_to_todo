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
String totalVideos = 'N/A';
String videoDuration = 'N/A';
String videoTitle = 'N/A';
String videoUrl = 'N/A';
String timeOfDay = 'N/A';
  const prompt ="""

I am a mobile app developer working on a project using the Gemini API. you are an expert with 20 years of experience in creating educational roadmaps for online teaching.

### Task:  
i want to structure a video learning plan that consists of around *4 hours of content per day* from the following playlist. Your goal is to optimize daily video time to be as close as possible to the *4-hour target. Create a roadmap* for consuming the videos, ensuring each day's total viewing time closely matches the 4-hour mark. After analyzing the playlist, *summarize the video's title and duration* for each day, then provide a *brief task description* to guide the learning process.

### Playlist Information:  
The playlist videos are presented in the following format:  
- *Title*: "تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي"  
- *Duration*: 5:52 (example)
- *url*: https://www.youtube.com/watch?v=xxxxxxxxxx

*Total Videos*: 62  
*Total Duration*: 6h 51m

Here is the full playlist:

1. تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي (5:52) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 
2. تعلم HTML من الصفر للإحتراف: تهيئة بيئة العمل وأدوات تساعدنا على كتابة الكود (7:25)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
3. تعلم HTML من الصفر للإحتراف: الهيكل الاساسي لصفحات الويب (7:12)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
4. تعلم HTML من الصفر للإحتراف: استخدام الادوات في تطوير صفحات الويب (6:50)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
5. تعلم HTML من الصفر للإحتراف: ما هو الـ Head tag وأهمية الـ Meta data (4:10) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 
6. تعلم HTML من الصفر للاحتراف: ما هو الـ Open Graph Protocol (5:09)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
7. تعلم HTML من الصفر للاحتراف: ماذا نتعلم في الوحدة الجديدة (2:30)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
8. تعلم HTML من الصفر للإحتراف: الـ heading وبداية مشروع الـ portfolio (5:40)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
9. تعلم HTML من الصفر للإحتراف: كتابة فقرة نصية باستخدام HTML (10:01)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
10. تعلم HTML من الصفر للإحتراف: تنسيق النصوص باستخدام الـ HTML (10:10)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
11. تعلم HTML من الصفر للاحتراف: حل تكليف تنسيق الـ Portfolio (10:39)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
12. تعلم HTML من الصفر للاحتراف: استخدام الاقتباسات والمصطلحات في HTML (9:18)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
13. تعلم HTML من الصفر للإحتراف: كتابة code برمجي داخل صفحة الـ HTML (11:41)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
14. تعلم HTML من الصفر للإحتراف: استخدام عنصر الـ a لإنشاء الروابط (12:26)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
15. تعلم HTML من الصفر للإحتراف: روابط وسائل التواصل في مشروع الـ Portfolio (7:57)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
16. تعلم HTML من الصفر للإحتراف: ماذا سنتعلم في الواحده الثالثة (1:47)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
17. تعلم HTML من الصفر للإحتراف: أستخدام القوائم "Lists" (6:15)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
18. تعلم HTML من الصفر للإحتراف: كيفية استخدام الصور في HTML (17:50)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
19. تعلم HTML من الصفر للإحتراف: انواع الصور في HTML (13:11)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
20. تعلم HTML من الصفر للإحتراف: ما هي الأيقونة المفضلة Favicon (3:22)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
21. تعلم HTML من الصفر للاحتراف: اضافة فيديو في صفحة الويب باستخدام HTML (6:51) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 
22. تعلم HTML من الصفر للاحتراف: استخدام الـ Source Tag لإضافة فيديو (5:19)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
23. تعلم HTML من الصفر للإحتراف: إضافة ملف صوتي في صفحة الويب باستخدام HTML (4:21) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 
24. تعلم HTML من الصفر للإحتراف: أستخدام iframe tag في الـ HTML (8:17)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
25. تعلم HTML من الصفر للإحتراف: تنظيم ملفات المشروع وتكليف الوحدة (5:07)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
26. تعلم HTML من الصفر للإحتراف: مشروع بناء صفحة الهبوط - Landing page (14:20)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
27. تعلم HTML من الصفر للاحتراف: تكملة مشروع بناء صفحة الهبوط - Landing page (8:24)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
28. تعلم HTML من الصفر للإحتراف: تكملة مشروع بناء صفحة الهبوط -2- Landing page (11:18) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 
29. تعلم HTML من الصفر للإحتراف آخر خطوة بمشروع بناء صفحة الهبوط - Landing page (9:37)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
30. تعلم HTML من الصفر للإحتراف: هنتعلم إيه في وحدة الـ Form في HTML5؟ (1:36)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
31. تعلم HTML من الصفر للإحتراف: مقدمة عن حقول إدخال النص - input element (5:54)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
32. تعلم HTML من الصفر للإحتراف: حقول إدخال النصوص في HTML (8:10)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
33. تعلم HTML من الصفر للإحتراف: استخدام أنواع حقول إدخال مختلفة (5:45)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
34. تعلم HTML من الصفر للاحتراف: كيفية إرسال البيانات لقاعدة البيانات (5:05)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
35. تعلم HTML من الصفر للاحتراف: التأكد من صحة البيانات (9:04)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
36. تعلم HTML من الصفر للإحتراف: بناء form لإرسال وسائل التواصل (7:02)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
37. تعلم HTML من الصفر للإحتراف: إرسال حقول الإدخال والتعرف علي name, action (8:58) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 
38. تعلم HTML من الصفر للاحتراف: أنواع حقول إدخال مختلفة (6:34)  ,http://www.youtube.com/watch?v=5fZIgq5nR6s
39. تعلم HTML من الصفر للاحتراف: إنشاء نموذج للتقدم إلى وظيفة (8:14) ,http://www.youtube.com/watch?v=5fZIgq5nR6s 
40. تعلم HTML من الصفر للاحتراف: تكملة انشاء ال Application form (11:42),http://www.youtube.com/watch?v=5fZIgq5nR6s

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