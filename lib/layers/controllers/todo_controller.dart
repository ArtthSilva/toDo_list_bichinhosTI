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


  pickCategory(String newCategory) {
    category.value = newCategory;
    notifyListeners();
  }

Future<int> saveTask(TaskModel task) async {
 int id = await SqfliteDB.insertTask(task);
 tasks.add(task);
 return id;
}


  Future<void> loadTasks() async {
 final tasksFromDb = await SqfliteDB.getTasks();
 tasks = tasksFromDb.map((task) => TaskModel.fromJson(task)).toList();
 notifyListeners();
}

}
