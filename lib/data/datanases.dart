import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yt_to_todo/model/playList.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'videos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE videos(
            id TEXT PRIMARY KEY,
            title TEXT,
            url TEXT,
            description TEXT,
            duration TEXT,
            image TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertVideo(VideoInfoModel video) async {
    final db = await database;
    await db.insert(
      'videos',
      video.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<VideoInfoModel>> getVideos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('videos');

    return List.generate(maps.length, (i) {
      return VideoInfoModel.fromMap(maps[i]);
    });
  }
}
