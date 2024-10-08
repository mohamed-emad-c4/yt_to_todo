import 'dart:convert';
import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yt_to_todo/logic/helper.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'playlist.db');

    print('Database path: $path');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    print('Creating tables...');
    await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE status_playlist (
          id INTEGER PRIMARY KEY,
          status_name TEXT NOT NULL
        )
      ''');

      await txn.execute('''
        CREATE TABLE playlist_info (
          idplaylist TEXT PRIMARY KEY,
          name TEXT NOT NULL,
          urlImage TEXT NOT NULL,
          description TEXT NOT NULL,
          total_videos INTEGER,
          start_from INTEGER UNIQUE,
          end_in INTEGER UNIQUE,
          url_playlist TEXT,
          total_time_playlist INTEGER,
          status_playlist_id INTEGER,
          video_owner_channel_title TEXT,
          FOREIGN KEY (status_playlist_id) REFERENCES status_playlist(id)
        )
      ''');

      await txn.execute('''
        CREATE TABLE video_info (
          idvideo TEXT PRIMARY KEY,
          title TEXT NOT NULL,
          image TEXT,
          url TEXT,
          description TEXT,
          duration TEXT,
          idplaylist TEXT,
          status_video_id INTEGER,
          days INTEGER,
          FOREIGN KEY (idplaylist) REFERENCES playlist_info(idplaylist)
        )
      ''');
    });
    print('Tables created successfully.');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('Upgrading database from version $oldVersion to $newVersion...');
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE video_info ADD COLUMN days INTEGER;');
    }
    print('Database upgraded successfully.');
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }

  /// ***Inserting Data***

  Future<List<Map<String, dynamic>>> fetchVideosByPlaylist(
      String playlistId) async {
    final db = await database;
    return await db.query(
      'video_info',
      where: 'idplaylist = ?',
      whereArgs: [playlistId],
    );
  }

  Future<Map<String, dynamic>?> fetchVideoById(String videoId) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'video_info',
      where: 'idvideo = ?',
      whereArgs: [videoId],
    );
    return result.isNotEmpty ? result.first : null;
  }

  /// ***Update Operations***

  Future<int> updateVideo(
      String videoId, Map<String, dynamic> updatedValues) async {
    final db = await database;
    return await db.update(
      'video_info',
      updatedValues,
      where: 'idvideo = ?',
      whereArgs: [videoId],
    );
  }

  Future<void> insertVideos(
      Database db, dynamic data, String playlistId) async {
    final items = data['items'];

    for (var item in items) {
      final videoId = item['contentDetails']['videoId'];
      final title = item['snippet']['title'];
      final description = item['snippet']['description'];
      final thumbnailUrl = item['snippet']['thumbnails']['high']['url'];
      final videoUrl = 'https://www.youtube.com/watch?v=$videoId';

      // Check if the video already exists in the database
      final existingVideo = await db.query(
        'video_info',
        where: 'idvideo = ?',
        whereArgs: [videoId],
      );

      if (existingVideo.isEmpty) {
        // If the video doesn't exist, insert it
        await db.insert('video_info', {
          'idvideo': videoId,
          'title': title,
          'image': thumbnailUrl,
          'url': videoUrl,
          'description': description,
          'duration': null, // يمكنك تعيين مدة الفيديو هنا لاحقًا
          'idplaylist': playlistId, // إضافة معرف قائمة التشغيل
        });
      } else {
        // If the video exists, you can update it if needed
        await db.update(
            'video_info',
            {
              'title': title,
              'image': thumbnailUrl,
              'url': videoUrl,
              'description': description,
              // تحديث أي معلومات أخرى تحتاج إلى تحديثها
            },
            where: 'idvideo = ?',
            whereArgs: [videoId]);
      }
    }
  }

  Future<int> insertPlaylistInfo(Map<String, dynamic> playlist) async {
    final db = await database;
    print('Inserting playlist: $playlist');
    final result = await db.insert('playlist_info', playlist,
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('Insert result: $result');
    return result;
  }

  Future<void> addPlaylistToDatabase(Map<String, dynamic> parsedJson) async {
    try {
      final String idplaylist = parsedJson['items'][0]['snippet']['playlistId'];
      final List<String?> detailsPL =
          await HelperFunction().getPlaylistTitle(idplaylist);
      final String? name = detailsPL[0];
      final int totalVideos = parsedJson['pageInfo']['totalResults'];

      // تحقق من resourceId إذا كان كائنًا
      final resourceId = parsedJson['items'][0]['snippet']['resourceId'];
      final String? urlPlaylist =
          resourceId['kind']; // أو الوصول إلى الخاصية الصحيحة
      final String? description = detailsPL[1];
      final String? urlImage = detailsPL[2];

      print(
          'Parsed data: idplaylist=$idplaylist, name=$name, description=$description, urlImage=$urlImage, totalVideos=$totalVideos');

      Map<String, dynamic> playlistData = {
        'idplaylist': idplaylist,
        'name': name,
        'description': description ?? "",
        'urlImage': urlImage ?? "",
        'total_videos': totalVideos,
        'start_from': 1,
        'end_in': totalVideos,
        'url_playlist': urlPlaylist,
        'total_time_playlist': 0,
        'status_playlist_id': 1,
        'video_owner_channel_title': parsedJson['items'][0]['snippet']
            ['channelTitle'],
      };

      await insertPlaylistInfo(playlistData);
    } catch (e) {
      print('Error in addPlaylistToDatabase: $e');
    }
  }

  /// ***Fetching All Videos by Playlist ID***
  Future<List<Map<String, dynamic>>> fetchVideosByPlaylistId(
      String playlistId) async {
    final db = await database;
    return await db.query(
      'video_info',
      where: 'idplaylist = ?',
      whereArgs: [playlistId],
    );
  }

  Future<List<String>> fetchAllPlaylistIds() async {
    final db = await database;
    final result = await db.query('playlist_info');

    if (result.isEmpty) {
      print("No playlists found.");
      return [];
    } else {
      print("Found playlists: $result");
      return result
          .map((playlist) => playlist['idplaylist'] as String)
          .toList();
    }
  }

  Future<void> logAllPlaylists() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('playlist_info');
    log('All playlist data: ${result[2]}'); // Log the entire content of the playlist_info table
  }

  Future<List<Map<String, dynamic>>> fetchAllPlaylists() async {
    final db = await database;
    // Corrected query to fetch all data from the playlist_info table
    final result = await db.query('playlist_info');

    // Print the result to verify the data
    log('All playlist data: ${result}');

    return result; // Return all the retrieved data
  }
}
