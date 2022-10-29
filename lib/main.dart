import 'package:flutter/material.dart';
import 'package:task_notes/screens/main_screen.dart';
import 'package:task_notes/styles/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  var tasksBox = await Hive.openBox('tasksBox');
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.appBarColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreenWidget(),
        
      },
    );
  }
}
