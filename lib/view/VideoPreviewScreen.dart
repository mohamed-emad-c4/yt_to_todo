import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/databases.dart';

class VideoPreviewScreen extends StatefulWidget {
  final String playlistId;

  const VideoPreviewScreen({super.key, required this.playlistId});

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  List<Map<String, dynamic>> playlistAllVideos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    // Fetch videos from the database using playlistId
    playlistAllVideos =
        await DatabaseHelper().getVideosByPlaylistId(widget.playlistId);
    setState(() {
      _isLoading = false;
    }); // Update the state to display the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist Videos'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : playlistAllVideos.isEmpty
              ? const Center(child: Text('No videos found'))
              : ListView.builder(
                  itemCount: playlistAllVideos.length,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (context, index) {
                    final video = playlistAllVideos[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: InkWell(
                        onTap: () async {
                          // Open the video URL in the browser
                          final url = video['video_url'];
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12.0)),
                              child: Image.network(
                                video['video_image'],
                                fit: BoxFit.cover,
                                height: 150,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                video['video_tittle'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              " ${video['video_duration']}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
