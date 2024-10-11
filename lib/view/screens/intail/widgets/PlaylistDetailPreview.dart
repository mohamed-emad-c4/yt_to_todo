/* --- Begin lib\view\screens\intail\widgets\PlaylistDetailPreview.dart --- */
import 'package:flutter/material.dart';
import '../../../../model/playList.dart';

class PlaylistPreviewAll extends StatelessWidget {
  final PlaylistPreview playlist;

  const PlaylistPreviewAll({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            playlist.playlistImage,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist.playlistRealName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total Videos: ${playlist.playlistTotalVideos}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total Time: ${playlist.playlistTotalTime}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/* --- End lib\view\screens\intail\widgets\PlaylistDetailPreview.dart --- */