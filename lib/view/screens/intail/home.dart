import 'package:flutter/material.dart';
import 'package:yt_to_todo/view/screens/intail/addPlayList.dart';

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
      },
      {
        "title": "Playlist 2",
        "description": "Description for Playlist 2",
        "image": "assets/images/welcome.png",
      },
      {
        "title": "Playlist 3",
        "description": "Description for Playlist 3",
        "image": "assets/images/welcome.png",
      },
      {
        "title": "Playlist 4",
        "description": "Description for Playlist 4",
        "image": "assets/images/welcome.png",
      },
      {
        "title": "Playlist 5",
        "description": "Description for Playlist 5",
        "image": "assets/images/welcome.png",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("YouTube to Todo"),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255), // YouTube red color
        elevation: 0, // Remove shadow for a modern look
      ),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the playlist detail screen or perform an action
              print("Tapped on ${playlists[index]['title']}");
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 4, // Add shadow for a modern look
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
                        playlists[index]['image'],
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
                            playlists[index]['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            playlists[index]['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          Navigator.push(context,  MaterialPageRoute(builder: (context) => const AddPlaylistScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
