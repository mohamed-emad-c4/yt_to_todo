import 'dart:developer';


import 'package:google_generative_ai/google_generative_ai.dart';

const giminiAiApiKey = "AIzaSyCLPtP-PRbk5R11EUZbpYdM1USwPRyHj5o";

class GiminiAi {
  void aiResponse() async {
  final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: giminiAiApiKey,

 
// Use the data to populate your Flutter UI
  );

  final prompt ="""

I am a mobile app developer working on a project using the Gemini API. you are an expert with 20 years of experience in creating educational roadmaps for online teaching.

### Task:  
i want to structure a video learning plan that consists of around *4 hours of content per day* from the following playlist. Your goal is to optimize daily video time to be as close as possible to the *4-hour target. Create a roadmap* for consuming the videos, ensuring each day's total viewing time closely matches the 4-hour mark. After analyzing the playlist, *summarize the video's title and duration* for each day, then provide a *brief task description* to guide the learning process.

### Playlist Information:  
The playlist videos are presented in the following format:  
- *Title*: "تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي"  
- *Duration*: 5:52 (example)

*Total Videos*: 62  
*Total Duration*: 6h 51m

Here is the full playlist:

1. تعلم HTML من الصفر: كورس تعلم تطوير وتصميم المواقع وبرمجة صفحات الويب بالعربي (5:52)  
2. تعلم HTML من الصفر للإحتراف: تهيئة بيئة العمل وأدوات تساعدنا على كتابة الكود (7:25)  
3. تعلم HTML من الصفر للإحتراف: الهيكل الاساسي لصفحات الويب (7:12)  
4. تعلم HTML من الصفر للإحتراف: استخدام الادوات في تطوير صفحات الويب (6:50)  
5. تعلم HTML من الصفر للإحتراف: ما هو الـ Head tag وأهمية الـ Meta data (4:10)  
6. تعلم HTML من الصفر للاحتراف: ما هو الـ Open Graph Protocol (5:09)  
7. تعلم HTML من الصفر للاحتراف: ماذا نتعلم في الوحدة الجديدة (2:30)  
8. تعلم HTML من الصفر للإحتراف: الـ heading وبداية مشروع الـ portfolio (5:40)  
9. تعلم HTML من الصفر للإحتراف: كتابة فقرة نصية باستخدام HTML (10:01)  
10. تعلم HTML من الصفر للإحتراف: تنسيق النصوص باستخدام الـ HTML (10:10)  
11. تعلم HTML من الصفر للاحتراف: حل تكليف تنسيق الـ Portfolio (10:39)  
12. تعلم HTML من الصفر للاحتراف: استخدام الاقتباسات والمصطلحات في HTML (9:18)  
13. تعلم HTML من الصفر للإحتراف: كتابة code برمجي داخل صفحة الـ HTML (11:41)  
14. تعلم HTML من الصفر للإحتراف: استخدام عنصر الـ a لإنشاء الروابط (12:26)  
15. تعلم HTML من الصفر للإحتراف: روابط وسائل التواصل في مشروع الـ Portfolio (7:57)  
16. تعلم HTML من الصفر للإحتراف: ماذا سنتعلم في الواحده الثالثة (1:47)  
17. تعلم HTML من الصفر للإحتراف: أستخدام القوائم "Lists" (6:15)  
18. تعلم HTML من الصفر للإحتراف: كيفية استخدام الصور في HTML (17:50)  
19. تعلم HTML من الصفر للإحتراف: انواع الصور في HTML (13:11)  
20. تعلم HTML من الصفر للإحتراف: ما هي الأيقونة المفضلة Favicon (3:22)  
21. تعلم HTML من الصفر للاحتراف: اضافة فيديو في صفحة الويب باستخدام HTML (6:51)  
22. تعلم HTML من الصفر للاحتراف: استخدام الـ Source Tag لإضافة فيديو (5:19)  
23. تعلم HTML من الصفر للإحتراف: إضافة ملف صوتي في صفحة الويب باستخدام HTML (4:21)  
24. تعلم HTML من الصفر للإحتراف: أستخدام iframe tag في الـ HTML (8:17)  
25. تعلم HTML من الصفر للإحتراف: تنظيم ملفات المشروع وتكليف الوحدة (5:07)  
26. تعلم HTML من الصفر للإحتراف: مشروع بناء صفحة الهبوط - Landing page (14:20)  
27. تعلم HTML من الصفر للاحتراف: تكملة مشروع بناء صفحة الهبوط - Landing page (8:24)  
28. تعلم HTML من الصفر للإحتراف: تكملة مشروع بناء صفحة الهبوط -2- Landing page (11:18)  
29. تعلم HTML من الصفر للإحتراف آخر خطوة بمشروع بناء صفحة الهبوط - Landing page (9:37)  
30. تعلم HTML من الصفر للإحتراف: هنتعلم إيه في وحدة الـ Form في HTML5؟ (1:36)  
31. تعلم HTML من الصفر للإحتراف: مقدمة عن حقول إدخال النص - input element (5:54)  
32. تعلم HTML من الصفر للإحتراف: حقول إدخال النصوص في HTML (8:10)  
33. تعلم HTML من الصفر للإحتراف: استخدام أنواع حقول إدخال مختلفة (5:45)  
34. تعلم HTML من الصفر للاحتراف: كيفية إرسال البيانات لقاعدة البيانات (5:05)  
35. تعلم HTML من الصفر للاحتراف: التأكد من صحة البيانات (9:04)  
36. تعلم HTML من الصفر للإحتراف: بناء form لإرسال وسائل التواصل (7:02)  
37. تعلم HTML من الصفر للإحتراف: إرسال حقول الإدخال والتعرف علي name, action (8:58)  
38. تعلم HTML من الصفر للاحتراف: أنواع حقول إدخال مختلفة (6:34)  
39. تعلم HTML من الصفر للاحتراف: إنشاء نموذج للتقدم إلى وظيفة (8:14)  
40. تعلم HTML من الصفر للاحتراف: تكملة انشاء ال Application form (11:44)  
41. تعلم HTML من الصفر للاحتراف: Textarea in Form element (9:06)  
42. تعلم HTML من الصفر للاحتراف: إنشاء نموذج ملف شخصي بالعربي والإنجليزي (6:50)  
43. تعلم HTML من الصفر للاحتراف: عناصر radio و checkbox (8:05)  
44. تعلم HTML من الصفر للاحتراف: استخدام select element (4:50)  
45. تعلم HTML من الصفر للإحتراف: حل تحدي إنشاء منيو لمطعم (5:46)  
46. تعلم HTML من الصفر للإحتراف: تقسيم القائمة لمجموعات (4:10)  
47. تعلم HTML من الصفر للإحتراف: وحدة العناصر الدلالية Semantic Elements (2:35)  
48. ما هي العناصر الدلالية: تعلم HTML من الصفر للإحتراف (3:20)  
49. إتقن الـ header حجر الأساس لتقديم موقعك على الإنترنت: تعلم HTML من الصفر للإحتراف (3:14)  
50. إنشاء موقع مقالات: تعلم HTML من الصفر للإحتراف (3:07)  
51. قائمة التنقل Nav: تعلم HTML من الصفر للإحتراف (3:37)  
52. إنشاء المحتوى لموقع المقالات: تعلم HTML من الصفر للإحتراف (4:32)  
53. تعلم HTML من الصفر للإحتراف: إنشاء sidebar لموقع المقالات (3:42)  
54. تعلم HTML من الصفر للإحتراف: إنشاء Footer لموقع المقالات (3:25)  
55. تعلم HTML من الصفر للمبتدئين: تحدي بإنشاء صفحة لعرض المقال الواحد (2:04)  
56. تعلم HTML من الصفر للإحتراف: تحليل ورسم هيكل صفحة عرض المقال (7:45)  
57. تعلم HTML من الصفر للإحتراف: كتابة كود صفحة عرض المقال (الجزء الأول) (7:33)  
58. تعلم HTML من الصفر للإحتراف: تكملة كود صفحة عرض المقال وإنهاء مشروع الوحدة (5:55)  
59. ماذا نتعلم في الوحدة الجديدة: استضافة المواقع: تعلم HTML من الصفر للإحتراف (1:11)  
60. مقدمة في استضافة المواقع على الويب: تعلم HTML من الصفر للإحتراف (2:55)  
61. مفهوم اسم النطاق وأهميته: تعلم HTML من الصفر للإحتراف (2:58)  
62. انواع الاستضافة: تعلم HTML من الصفر للإحتراف (4:06)

---

### Instructions:  
1. Analyze the video durations and distribute them evenly across 7 days.  
2. Each day’s total should be approximately *4 hours*.  
3. Provide a *summary* of tasks or goals for each day based on the video content.  
4. give me the response in json format to put it directly into the database.
""" ;
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);

  log(response.text.toString());
}
}
