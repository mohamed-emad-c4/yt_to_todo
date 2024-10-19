import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yt_to_todo/generated/l10n.dart';
import 'package:yt_to_todo/logic/helper.dart';
import '../../../data/databases.dart';

final List<Map<String, dynamic>> daysAndVideos = [
  {
    "day": "Day 1", // Ensure this is a String
    "videos": [
      {
        "title": "Important Before You Start With C++ Course",
        "duration": "00:03:36",
        "url": "https://www.youtube.com/watch?v=DzwcA_sRIss",
        "learning_video_task": "Understand the importance of preparation and what to expect from the C++ course."
      },
      {
        "title": "Important: What to Expect from this C++ Course?",
        "duration": "00:11:26",
        "url": "https://www.youtube.com/watch?v=KtCBGz9xcgI",
        "learning_video_task": "Gain insight into the course structure, content, and learning objectives."
      },
      {
        "title": "Lesson #01 - Why to Start with C++?",
        "duration": "00:02:12",
        "url": "https://www.youtube.com/watch?v=4VepZmDa8Ic",
        "learning_video_task": "Explore the reasons why C++ is a valuable language to learn."
      },
      {
        "title": "Lesson #02 - What is C++?",
        "duration": "00:09:36",
        "url": "https://www.youtube.com/watch?v=wr8A8i8vlBQ",
        "learning_video_task": "Gain a foundational understanding of the C++ programming language."
      },
      {
        "title": "Lesson #03 - What can you do with C++?",
        "duration": "00:13:37",
        "url": "https://www.youtube.com/watch?v=ZczjYLPTrpc",
        "learning_video_task": "Discover the wide range of applications and possibilities with C++."
      }
    ],
    "total_duration": "00:39:57",
    "learning_task": "Get familiar with the C++ course and its key aspects."
  },
  {
    "day": "Day 2", // Ensure this is a String
    "videos": [
      {
        "title": "Lesson #5 - Why to start with C++ not Java?",
        "duration": "00:03:20",
        "url": "https://www.youtube.com/watch?v=7T4WXJa2bxM",
        "learning_video_task": "Compare C++ and Java, understand why C++ is preferred in certain situations."
      },
      {
        "title": "Lesson #4 - Why to start with C++ not C?",
        "duration": "00:04:02",
        "url": "https://www.youtube.com/watch?v=eP5F7dzZ2lg",
        "learning_video_task": "Compare C++ and C, understand why C++ is a more advanced choice."
      },
      {
        "title": "Lesson #06 - Why to Start with C++ Not Python?",
        "duration": "00:03:37",
        "url": "https://www.youtube.com/watch?v=811NJSnQvng",
        "learning_video_task": "Compare C++ and Python, understand why C++ is more suitable for certain tasks."
      },
      {
        "title": "Lesson #07 - Is C++ Outdated and not Used?!",
        "duration": "00:01:59",
        "url": "https://www.youtube.com/watch?v=811NJSnQvng",
        "learning_video_task": "Address the misconception of C++ being outdated and explore its continued relevance."
      },
      {
        "title": "Lesson #08 - Will I Find Work In C++?",
        "duration": "00:02:05",
        "url": "https://www.youtube.com/watch?v=NQyAzxp6bzs",
        "learning_video_task": "Gain reassurance about job opportunities in the C++ field."
      },
      {
        "title": "Lesson #09 - C++ Will Give you the Future Keys in Programming!",
        "duration": "00:00:57",
        "url": "https://www.youtube.com/watch?v=on7z9pg5MvM",
        "learning_video_task": "Understand why C++ provides a strong foundation for future programming endeavors."
      },
      {
        "title": "Lesson # 10 - Get Started - Install Visual Studio 2022 IDE With C++",
        "duration": "00:08:48",
        "url": "https://www.youtube.com/watch?v=oG62eWTIAdc",
        "learning_video_task": "Learn how to set up the Visual Studio 2022 IDE for C++ development."
      }
    ],
    "total_duration": "00:34:44",
    "learning_task": "Master the syntax and output capabilities of C++."
  },
];


class AllDaysRoadmap extends StatefulWidget {
  const AllDaysRoadmap({super.key});

  @override
  _AllDaysRoadmapState createState() => _AllDaysRoadmapState();
}

class _AllDaysRoadmapState extends State<AllDaysRoadmap> {
  late List<bool> expandedDays;

  @override
  void initState() {
    super.initState();
    expandedDays = List.generate(daysAndVideos.length, (index) => false);
  }

  void toggleDay(int index) {
    setState(() {
      expandedDays[index] = !expandedDays[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Building AllDaysRoadmap");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).all_days_roadmap),
      ),
      body: ListView.builder(
        itemCount: daysAndVideos.length,
        itemBuilder: (context, index) {
          log("Building DaySection for index: $index");
          final dayData = daysAndVideos[index];
          return DaySection(
            day: dayData['day'] as String,
            videos: List<Map<String, dynamic>>.from(
                dayData['videos'] as List<Map<String, dynamic>>),
            totalDuration: dayData['total_duration'] as String,
            learningTask: dayData['learning_task'] as String,
            isExpanded: expandedDays[index],
            onTap: () => toggleDay(index),
          );
        },
      ),
    );
  }
}

class DaySection extends StatelessWidget {
  final String day;
  final List<Map<String, dynamic>> videos;
  final String totalDuration;
  final String learningTask;
  final bool isExpanded;
  final VoidCallback onTap;

  const DaySection({
    super.key,
    required this.day,
    required this.videos,
    required this.totalDuration,
    required this.learningTask,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    log("Building DaySection for day: $day");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.expand_more),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? null : 0,
          child: isExpanded
              ? Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        final video = videos[index];
                        return VideoCard(
                          video: video['title'],
                          duration: video['duration'],
                          url: video['url'],
                          learningTask: video['learning_video_task'],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total Duration: $totalDuration",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Learning Task: $learningTask",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              : null,
        ),
        const Divider(
          height: 8,
          thickness: 2,
          color: Colors.grey,
        ),
      ],
    );
  }
}
// To open YouTube link

class VideoCard extends StatelessWidget {
  final String video;
  final String duration;
  final String url;
  final String learningTask;

  const VideoCard({
    super.key,
    required this.video,
    required this.duration,
    required this.url,
    required this.learningTask,
  });

  // Method to open video URL in YouTube app or browser
  void _openVideo(BuildContext context, String url) async {
    final Uri videoUri = Uri.parse(url);
    if (await canLaunchUrl(videoUri)) {
      await launchUrl(videoUri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open the video.")),
      );
    }
  }

  // Method to show the task details in a dialog
  void _showTaskDialog(BuildContext context, String task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Learning Task"),
        content: Text(task),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Method to handle video marking logic (e.g., marking as complete)
  void _markVideo(BuildContext context) {
    // Placeholder for the mark video logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Video marked!")),
    );
  }

  // Method to summarize the video (placeholder functionality)
  void _summarizeVideo(BuildContext context) {
    // Placeholder for the summarize functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Summary of the video: Coming soon!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Optionally handle tap to view video details
      },
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail of the video
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://img.youtube.com/vi/${Uri.parse(url).queryParameters['v']}/0.jpg",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey,
                          child: const Center(
                            child: Icon(Icons.error, color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.play_circle_outline,
                          color: Colors.white, size: 40),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),

              // Video info and action icons
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Duration: $duration",
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Task: $learningTask",
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              
              // Action buttons
              Column(
                children: [
                  IconButton(
                    tooltip: 'Show Task',
                    icon: const Icon(Icons.task),
                    onPressed: () => _showTaskDialog(context, learningTask),
                  ),
                  IconButton(
                    tooltip: 'Open in YouTube',
                    icon: const Icon(Icons.ondemand_video),
                    onPressed: () => _openVideo(context, url),
                  ),
                  IconButton(
                    tooltip: 'Mark Video',
                    icon: const Icon(Icons.check_circle_outline),
                    onPressed: () => _markVideo(context),
                  ),
                  IconButton(
                    tooltip: 'Summarize Video',
                    icon: const Icon(Icons.article_outlined),
                    onPressed: () => _summarizeVideo(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
