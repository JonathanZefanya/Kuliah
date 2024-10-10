import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'schedule.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE schedules (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        date TEXT,
        time TEXT
      )
    ''');
  }

  Future<int> insertSchedule(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('schedules', row);
  }

  Future<List<Map<String, dynamic>>> queryAllSchedules() async {
    Database db = await database;
    return await db.query('schedules');
  }

  Future<int> deleteSchedule(int id) async {
    Database db = await database;
    return await db.delete('schedules', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateSchedule(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('schedules', row, where: 'id = ?', whereArgs: [id]);
  }
}
