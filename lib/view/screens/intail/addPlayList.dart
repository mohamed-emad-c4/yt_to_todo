import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_to_todo/logic/helper.dart';
import 'package:yt_to_todo/logic/roadmap_logic/ai.dart';
import '../../../logic/cubit/update_home_cubit.dart';

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
  bool _isLoading = false;

  String extractPlaylistId(String url) {
    // Regular expression to match the playlist ID
    RegExp regExp = RegExp(r'list=([a-zA-Z0-9_-]+)');
    Match? match = regExp.firstMatch(url);
    return match?.group(1) ?? '';
  }

  Future<void> _insertPlaylist() async {
    GiminiAi().aiResponse();

    if (_formKey.currentState!.validate()) {
      String url = _urlController.text;
      String notes = _notesController.text;
      playlistId = extractPlaylistId(url);

      if (playlistId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid playlist URL')),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      try {
        await HelperFunction().getAllVideosInPlaylist(playlistId);

        dev.log('URL: $url');
        dev.log('Notes: $notes');

        // Clear the text fields after submission
        _urlController.clear();
        _notesController.clear();

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Playlist added successfully')),
        );

        // Update the home screen
        BlocProvider.of<UpdateHomeCubit>(context).updateHome();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
    Navigator.pop(context);
    BlocProvider.of<UpdateHomeCubit>(context).updateHome();
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
        title: const Text('Add Playlist'),
      ),
      body: SingleChildScrollView(
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
                  filled: true,
                  fillColor: Colors.white,
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
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  
                  onPressed: _insertPlaylist,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Insert',
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
