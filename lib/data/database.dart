import 'package:hive_flutter/hive_flutter.dart';

class TasksDataBase {
  List tasksList = [];

  final tasksBox = Hive.box('tasksBox');

  void createInitData() {
    tasksList = [
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
