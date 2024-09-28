import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
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
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE video_info ADD COLUMN days INTEGER;');
    }
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }

  /// ***Inserting Data***

  Future<int> insertVideo(Map<String, dynamic> video, {Transaction? txn}) async {
    final db = txn ?? await database;
    return await db.insert('video_info', video, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// ***Fetching Data***

  Future<List<Map<String, dynamic>>> fetchVideosByPlaylist(String playlistId) async {
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

  Future<int> updateVideo(String videoId, Map<String, dynamic> updatedValues) async {
    final db = await database;
    return await db.update(
      'video_info',
      updatedValues,
      where: 'idvideo = ?',
      whereArgs: [videoId],
    );
  }
}