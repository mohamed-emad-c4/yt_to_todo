import 'package:flutter/material.dart';
import 'package:yt_to_todo/view/screens/intail/addPlayList.dart';
import 'package:yt_to_todo/view/screens/intail/old_playlist.dart';

import 'widgets/preview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for the playlists
    final List<Map<String, dynamic>> playlists = [
      {
        "title": "Playlist 1",
        "description": "Description for Playlist 1",
        "image": "assets/images/welcome.png",
        "url":"This is the url for playlist 1"
      },
      {
        "title": "Playlist 2",
        "description": "Description for Playlist 2",
        "image": "assets/images/welcome.png",
        "url":"This is the url for playlist 2"
      },
      {
        "title": "Playlist 3",
        "description": "Description for Playlist 3",
        "image": "assets/images/welcome.png",
        "url":"This is the url for playlist 3"
      },
      {
        "title": "Playlist 4",
        "description": "Description for Playlist 4",
        "image": "assets/images/welcome.png",
        "url":"This is the url for playlist 4"
      },
      {
        "title": "Playlist 5",
        "description": "Description for Playlist 5",
        "image": "assets/images/welcome.png",
        "url":"This is the url for playlist 5"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("YouTube to Todo",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        
        elevation: 0, // Remove shadow for a modern look
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                return Preview_Widget(
                  ontap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => OldPlaylist ()));                  },
                  image: "${playlists[index]['image']}",
                  title: '${playlists[index]['title']}',
                  description: '${playlists[index]['description']}',
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddPlaylistScreen()));
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
