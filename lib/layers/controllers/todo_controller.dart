import 'package:flutter/material.dart';

class TodoController extends ChangeNotifier{
  ValueNotifier isSelected = ValueNotifier<bool>(false);
  
  void escolher(){
    if(isSelected.value){
      isSelected.value = false;
    }else{
      isSelected.value = true;
    }
    notifyListeners();
  }
}