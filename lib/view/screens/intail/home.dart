import 'package:flutter/material.dart';
import 'package:yt_to_todo/view/screens/intail/addPlayList.dart';
import 'package:yt_to_todo/view/screens/intail/widgets/PlaylistDetailPreview.dart';

import '../../../model/playList.dart';

class VideoPlaylistScreen extends StatelessWidget {
  final List<PlaylistPreview> videos = [
    PlaylistPreview(
      title: 'Flutter Tutorial for Beginners',
      description:
          'Learn Flutter from scratch with this comprehensive tutorial.',
      thumbnailUrl: 'https://via.placeholder.com/150',
    ),
    PlaylistPreview(
      title: 'Dart Programming Language',
      description: 'A deep dive into the Dart programming language.',
      thumbnailUrl: 'https://via.placeholder.com/150',
    ),
    PlaylistPreview(
      title: 'Flutter Widget of the Week',
      description: 'Explore the latest Flutter widgets in this weekly series.',
      thumbnailUrl: 'https://via.placeholder.com/150',
    ),
    // Add more videos as needed
  ];

  VideoPlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Playlist'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Use GridView for tablet screens
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return PlaylistPreviewAll(video: videos[index]);
              },
            );
          } else {
            // Use ListView for mobile screens
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return PlaylistPreviewAll(video: videos[index]);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PlaylistInputScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
