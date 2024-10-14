
import 'package:flutter/material.dart';

class AllDaysRoadmap extends StatelessWidget {
  final List<Map<String, dynamic>> daysAndVideos = [
    {
      'day': 'Day 1',
      'videos': ['Video 1', 'Video 2', 'Video 3', 'Video 4', 'Video 5'],
      'image': 'assets/images/lan.png'
    },
    {
      'day': 'Day 2',
      'videos': ['Video 6', 'Video 7', 'Video 8', 'Video9', 'Video 10'],
      'image': 'assets/images/lan.png'
    },
    {
      'day': 'Day 3',
      'videos': ['Video 11', 'Video 12', 'Video 13', 'Video 14', 'Video 15'],
      'image': 'assets/images/lan.png'
    },
    {
      'day': 'Day 4',
      'videos': ['Video 16', 'Video 17', 'Video 18', 'Video 19', 'Video 20'],
      'image': 'assets/images/lan.png'
      }
  ];

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
          final day = daysAndVideos[index]['day'];
          final videos = daysAndVideos[index]['videos'] as List<String>;
          final videoImage = daysAndVideos[index]['image'] as String;
          final isDone = false;
          final onTap = () {};
      
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  day,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: videos.map((video) {
                  return GestureDetector(
              onTap: onTap,
              child: Card(
                color: isDone == true ? Colors.green : Colors.grey[200],
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          videoImage,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
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
                              "Duration",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.double_arrow_rounded, color: Colors.grey[700]),
                    ],
                  ),
                ),
              ),
            );
                }).toList(),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}