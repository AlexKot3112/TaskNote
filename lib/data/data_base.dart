import 'package:hive_flutter/hive_flutter.dart';

class TasksDataBase {
  List tasksList = [];

  final tasksBox = Hive.box('tasksBox');

  void firstTimeInitData() {
    tasksList = [
      //[[0],[1],[2]]
      ['Task name', 'Task description', false]
    ];
  }

  void loadDataFromDatabase() {
    tasksList = tasksBox.get('TASKSLIST');
  }

  void updateDataBase() {
    tasksBox.put('TASKSLIST', tasksList);
  }
}
