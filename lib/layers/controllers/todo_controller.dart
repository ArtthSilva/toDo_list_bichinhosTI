import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/layers/models/task_model.dart';


class TodoController extends ChangeNotifier{
    ValueNotifier category = ValueNotifier<String>('');
 
  
  
   escolher(String newCategory){
    category.value = newCategory;
    notifyListeners();
  }

  Future<void> saveTask(TaskModel task) async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.setString('task', jsonEncode(task.toJson()));
 print(task.annotation);
}

}