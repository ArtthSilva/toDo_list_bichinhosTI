import 'package:flutter/material.dart';
import 'package:todo_list/layers/database/sqflite_db.dart';
import 'package:todo_list/layers/models/task_model.dart';

class TodoController extends ChangeNotifier {
  ValueNotifier category = ValueNotifier<String>('');
  List<TaskModel> tasks = [];

  static final TodoController _singleton = TodoController._internal();

  factory TodoController() {
    return _singleton;
  }

  TodoController._internal();

  escolher(String newCategory) {
    category.value = newCategory;
    notifyListeners();
  }

  Future<void> saveTask(TaskModel task) async {
    await SqfliteDB.insertTask(task);
    tasks.add(task);
    print(task.annotation);
    print(tasks.length);
  }
}
