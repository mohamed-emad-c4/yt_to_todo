import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yt_to_todo/logic/helper.dart';
import 'package:yt_to_todo/model/playList.dart';

class PlaylistInputScreen extends StatefulWidget {
  const PlaylistInputScreen({super.key});

  @override
  _PlaylistInputScreenState createState() => _PlaylistInputScreenState();
}

class _PlaylistInputScreenState extends State<PlaylistInputScreen> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String playlistId = '';
  String extractPlaylistId(String url) {
    // Regular expression to match the playlist ID
    RegExp regExp = RegExp(r'list=([a-zA-Z0-9_-]+)');
    Match? match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    }
    return '';
  }

  void _insertPlaylist() async {
    if (_formKey.currentState!.validate()) {
      String url = _urlController.text;
      String notes = _notesController.text;
      playlistId = extractPlaylistId(url);
      await HelperFunction().getAllVideosInPlaylist(playlistId);

      log('URL: $url');
      log('Notes: $notes');

      // Clear the text fields after submission
      _urlController.clear();
      _notesController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Playlist added successfully')),
      );
    }
  }

  String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a URL';
    }
    if (!value.contains('youtube.com/playlist?list=')) {
      return 'Please enter a valid YouTube playlist URL';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(
                  labelText: 'Playlist URL',
                  hintText: 'Enter the URL of the playlist',
                  border: OutlineInputBorder(),
                ),
                validator: _validateUrl,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Notes',
                  hintText: 'Enter any notes about the playlist',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _insertPlaylist,
                child: const Text('Insert'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // getPlaylistInfo(); Done
          // List<String?> data = await HelperFunction()
          //     .getPlaylistInfo("PLiYa0cuKkwo5N723E3qmghvOfiwHhEiJf");
          // log(data.toString());
          // log("===========================================================");
          // //??Done
          // // log(await HelperFunction().getDurationVideo("MRdfx-rNuZk"));
          // log(HelperFunction().extractDuration("00:10:05"));
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
