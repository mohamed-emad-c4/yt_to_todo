import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yt_to_todo/logic/helper.dart';

import '../../../data/databases.dart';

class AllDaysRoadmap extends StatefulWidget {
  const AllDaysRoadmap({super.key});

  @override
  _AllDaysRoadmapState createState() => _AllDaysRoadmapState();
}

class _AllDaysRoadmapState extends State<AllDaysRoadmap> {
  final List<Map<String, dynamic>> daysAndVideos = [
    {
      'day': 'Day 1',
      'videos': ['Video 1', 'Video 2', 'Video 3', 'Video 4', 'Video 5'],
      'image': 'assets/images/lan.png',
    },
    {
      'day': 'Day 2',
      'videos': ['Video 6', 'Video 7', 'Video 8', 'Video9', 'Video 10'],
      'image': 'assets/images/lan.png',
    },
    {
      'day': 'Day 3',
      'videos': ['Video 11', 'Video 12', 'Video 13', 'Video 14', 'Video 15'],
      'image': 'assets/images/lan.png',
    },
    {
      'day': 'Day 4',
      'videos': ['Video 16', 'Video 17', 'Video 18', 'Video 19', 'Video 20'],
      'image': 'assets/images/lan.png',
    }
  ];

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('The Playlist Roadmap'),
      ),
      body: ListView.builder(
        itemCount: daysAndVideos.length,
        itemBuilder: (context, index) {
          final dayData = daysAndVideos[index];
          return DaySection(
            day: dayData['day'] as String,
            videos: List<String>.from(dayData['videos']),
            image: dayData['image'] as String,
            isExpanded: expandedDays[index],
            onTap: () => toggleDay(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log("start");
        await  HelperFunction()
              .getPlaylistIfoFromDB("PLT5kbFRZy7AF99D1LovkbAit6TYzqOOMV");
              List<Map<String, dynamic>> getVideosByPlaylistId = await DatabaseHelper().getVideosByPlaylistId("PLT5kbFRZy7AF99D1LovkbAit6TYzqOOMV");
              log("getVideosByPlaylistId :: ${getVideosByPlaylistId.length}");
          log("end");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DaySection extends StatelessWidget {
  final String day;
  final List<String> videos;
  final String image;
  final bool isExpanded;
  final VoidCallback onTap;

  const DaySection({
    super.key,
    required this.day,
    required this.videos,
    required this.image,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    return VideoCard(
                      video: videos[index],
                      image: image,
                    );
                  },
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

class VideoCard extends StatelessWidget {
  final String video;
  final String image;

  const VideoCard({
    super.key,
    required this.video,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Implement your video tap functionality here
      },
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
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
                      "Duration: 10 mins", // Example of adding a duration dynamically
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
              const Icon(Icons.double_arrow_rounded, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
