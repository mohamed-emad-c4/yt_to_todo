import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_to_todo/view/VideoPreviewScreen.dart';
import 'package:yt_to_todo/data/databases.dart';
import 'package:yt_to_todo/logic/cubit/update_home_cubit.dart';
import 'package:yt_to_todo/view/screens/intail/addPlayList.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateHomeCubit(),
      child: BlocConsumer<UpdateHomeCubit, UpdateHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UpdateHomeLoaded || state is UpdateHomeInitial) {
            return const PlaylistScreen();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late Future<List<Map<String, dynamic>>> playlists;

  @override
  void initState() {
    super.initState();
    playlists = DatabaseHelper().getPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Playlists'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: playlists,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No playlists found'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            itemBuilder: (context, index) {
              final playlist = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPreviewScreen(
                        playlistId: playlist['playlist_id'],
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12.0)),
                        child: Image.network(
                          playlist['playlist_image'] ?? 'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playlist['playlist_real_name'] ?? 'No Title',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Total Videos: ${playlist['playlist_total_videos'] ?? 0} \nTotal Time: ${playlist['playlist_total_time'] ?? 0}",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PlaylistInputScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
