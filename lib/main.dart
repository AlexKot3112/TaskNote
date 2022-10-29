import 'package:flutter/material.dart';
import 'package:task_notes/screens/main_screen.dart';
import 'package:task_notes/styles/colors.dart';
void main() {
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
