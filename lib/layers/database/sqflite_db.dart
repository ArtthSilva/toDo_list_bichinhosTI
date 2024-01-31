import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/layers/models/task_model.dart';


class SqfliteDB {
 static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        category TEXT,
        date TEXT,
        hour TEXT,
        annotation TEXT
      )
      """);
 }

 static Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todolistbichinhos.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
 }

 static Future<int> insertTask(TaskModel task) async {
    final db = await SqfliteDB.db();
    final data = {
      'title': task.title,
      'category': task.category,
      'date': task.date.toString(),
      'hour': task.hour.toString(),
      'annotation': task.annotation
    };
    final id = await db.insert('tasks', data, conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
 }

 static Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await SqfliteDB.db();
    return db.query('tasks', orderBy: "id");
 }

 static Future<int> updateTask(int id, TaskModel task) async {
    final db = await SqfliteDB.db();
    final data = {
      'title': task.title,
      'category': task.category,
      'date': task.date.toString(),
      'hour': task.hour.toString(),
      'annotation': task.annotation
    };
    final result = await db.update('tasks', data, where: "id = ?", whereArgs: [id]);
    return result;
 }

 static Future<void> deleteTask(int id) async {
    final db = await SqfliteDB.db();
    try {
      await db.delete("tasks", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting a task: $err");
    }
 }

 static Future<void> deleteTable() async {
 final db = await SqfliteDB.db();
 await db.execute("DROP TABLE IF EXISTS tasks");
}
}
