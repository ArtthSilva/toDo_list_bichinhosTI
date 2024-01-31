import 'package:flutter/material.dart';
import 'package:todo_list/layers/database/sqflite_db.dart';
import 'package:todo_list/layers/models/task_model.dart';

class TodoController extends ChangeNotifier {
  ValueNotifier category = ValueNotifier<String>('');
  List<TaskModel> tasks = [];

  static final TodoController _singleton = TodoController._();
  TodoController._();
  factory TodoController() {
    return _singleton;
  }


  escolher(String newCategory) {
    category.value = newCategory;
    notifyListeners();
  }

  Future<void> saveTask(TaskModel task) async {
    await SqfliteDB.insertTask(task);
    tasks.add(task);
  }

  Future<void> loadTasks() async {
 final tasksFromDb = await SqfliteDB.getTasks();
 tasks = tasksFromDb.map((task) => TaskModel.fromJson(task)).toList();
}

 

}
