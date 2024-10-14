import 'dart:developer' as dev;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_to_todo/generated/l10n.dart';
import 'package:yt_to_todo/logic/helper.dart';
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
  if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });

    try {
      String url = _urlController.text;
      String notes = _notesController.text;
      playlistId = extractPlaylistId(url);

      if (playlistId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('${S.of(context).invalid_playlist_URL}')),
        );
        return;
      }

      await HelperFunction().getAllVideosInPlaylist(playlistId);
      dev.log('${S.of(context).url}: $url');
      dev.log('${S.of(context).notes}: $notes');

      // Notify the home page about the update using Cubit
      BlocProvider.of<UpdateHomeCubit>(context).updateHome();

      // Return true to notify the previous screen to reload data
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${S.of(context).error}: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

  String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return '${S.of(context).please_enter_a_URL}';
    }
    if (!value.contains('youtube.com/playlist?list=')) {
      return '${S.of(context).please_enter_a_valid_youtube_playlist_URL}';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${S.of(context).add_Playlist}'),
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
                decoration:  InputDecoration(
                  labelText: '${S.of(context).playlist_url}',
                  hintText: '${S.of(context).enter_the_URL_of_the_playlist}',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: _validateUrl,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _notesController,
                decoration:  InputDecoration(
                  labelText: '${S.of(context).notes}',
                  hintText: '${S.of(context).enter_any_notes_about_the_playlist}',
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child:  Text(
                    '${S.of(context).insert}',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () async {
           log("start");
    List<String?> allInfoPlaylist=    await  HelperFunction()
              .getPlaylistIfoFromDB("PLCInYL3l2AajYlZGzU_LVrHdoouf8W6ZN");

          log("end");
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}
