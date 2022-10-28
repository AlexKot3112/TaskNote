import 'package:flutter/material.dart';
import 'package:task_notes/widgets/task_card.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  List tasksList = [
    [
      'Make flutter App',
      'short description aboutefvih;fj v vuiyttctctctctctctctctctctctctvhgcdxeliyrlbvzjh .fv;abvzliur process coding',
      true,
    ],
    [
      'Make flutter App',
      'short description about UI design',
      false,
    ],
    [
      'Make flutter App',
      'short description about app fitures',
      true,
    ],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tasksList[index][2] = !tasksList[index][2];
    });
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Tasks List';
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 201, 230),
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/alert');
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: ((context, index) {
          return TaskCardWidget(
            title: tasksList[index][0],
            description: tasksList[index][1],
            taskComplited: tasksList[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        }),
      ),
    );
  }
}
