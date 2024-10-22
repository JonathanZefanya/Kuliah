import 'package:recipe_app/app/data/notification.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;
  static final DBHelper instance = DBHelper._init();

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notification.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE notifications (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_recipe INTEGER,
      time TEXT
    )
    ''');
  }

  Future<int> createNotification(Notification notification) async {
    final db = await instance.database;
    return await db.insert('notifications', notification.toJson());
  }

  Future<List> fetchNotifications() async {
    final db = await instance.database;
    final result = await db.query('notifications');

    return result.map((json) => Notification.fromJson(json)).toList();
  }

  Future<int> deleteNotification(int id) async {
    final db = await instance.database;
    return await db.delete(
      'notifications',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllNotifications() async {
    final db = await instance.database;
    return await db.delete('notifications');
  }
}