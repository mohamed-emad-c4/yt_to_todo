import 'package:flutter/material.dart';
import 'widgets/preview_widget.dart';

class OldPlaylist extends StatelessWidget {
  OldPlaylist({super.key});
  final List<Map<String, dynamic>> videosList = [
    {
      "title": "video 1",
      "description": "Description for video 1",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 1",
    },
    {
      "title": "video 2",
      "description": "Description for video 2",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 2",
    },
    {
      "title": "video 3",
      "description": "Description for video 3",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 3",
    },
    {
      "title": "video 4",
      "description": "Description for video 4",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 4",
    },
    {
      "title": "video 5",
      "description": "Description for video 5",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 5",
    },
    {
      "title": "video 6",
      "description": "Description for video 6",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 6",
    },
    {
      "title": "video 7",
      "description": "Description for video 7",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 7",
    },
    {
      "title": "video 7",
      "description": "Description for video 7",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 7",
    },
    {
      "title": "video 8",
      "description": "Description for video 8",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 8",
    },
    {
      "title": "video 9",
      "description": "Description for video 9",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 9",
    },
    {
      "title": "video 10",
      "description": "Description for video 10",
      "image": "assets/images/welcome.png",
      "duration": "This is the duration for video 10",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        elevation: 0,
        centerTitle: true,
        title:  const Text(
              "Old Playlist View",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Playlist Name",
            style: TextStyle(color : Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          Expanded(
            child: ListView.builder(
              itemCount: videosList.length,
              itemBuilder: (context, index) {
                return Preview_Widget(
                  title: videosList[index]['title'],
                  description: videosList[index]['description'],
                  image: videosList[index]['image'],
                  duration: videosList[index]['duration'], ontap: () {  },
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
