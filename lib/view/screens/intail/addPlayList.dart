import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yt_to_todo/data/databases.dart';
import 'package:yt_to_todo/logic/helper.dart';
import 'package:yt_to_todo/logic/roadmap_logic/ai.dart';
import 'package:yt_to_todo/model/playList.dart';
import 'package:yt_to_todo/view/screens/intail/current_playlist.dart';

String link = "";

class AddPlaylistScreen extends StatefulWidget {
  const AddPlaylistScreen({super.key});

  @override
  _AddPlaylistScreenState createState() => _AddPlaylistScreenState();
}

class _AddPlaylistScreenState extends State<AddPlaylistScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  bool _isLoading = false;
  String _totalDuration = "";

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        String name = _nameController.text;
        link = _linkController.text;
        log("Playlist Name: $name, Playlist Link: $link");

        List<VideoInfoModel> videoList = await HelperFunction()
            .getAllVideosInPlaylist(link.split("playlist?list=")[1]);
        _totalDuration = HelperFunction().sumTotalTime(videoList);

        // Show a success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Playlist added successfully!')),
        );
      } catch (e) {
        log("Error fetching playlist: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching playlist: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  bool _isValidYouTubePlaylistLink(String link) {
    // Regular expression to match YouTube playlist links
    final RegExp youtubePlaylistRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/playlist\?list=[a-zA-Z0-9_-]+$',
    );
    return youtubePlaylistRegex.hasMatch(link);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Playlist"),
        centerTitle: true,
        elevation: 0, // Remove shadow for a modern look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Playlist Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a playlist name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _linkController,
                decoration: InputDecoration(
                  labelText: "Playlist Link",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a playlist link';
                  }
                  if (!_isValidYouTubePlaylistLink(value)) {
                    return 'Please enter a valid YouTube playlist link';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Add Playlist",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
              const SizedBox(height: 24),
              Text(
                _totalDuration,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CurrentPlaylist(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
