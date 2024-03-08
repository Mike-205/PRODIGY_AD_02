import 'package:flutter/cupertino.dart';

class TaskData extends ChangeNotifier {
  final Map<String, bool> _toDoTask = {
    "Code in the evening": false,
    "Hiking" : false,
    "Go to the gym" : false,
    "Read a book" : false,
  };

  Map<String, bool> get toDoTask => _toDoTask;

  void addTask (String toDoTask){
    _toDoTask[toDoTask] = false;
    notifyListeners();
  }

  void deleteTask (String toDoTask){
    _toDoTask.remove(toDoTask);
    notifyListeners();
  }

  void toggleTask(String toDoTask){
    _toDoTask[toDoTask] = !_toDoTask[toDoTask]!;
    notifyListeners();
  }

}