import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_notes/screens/new_task_alert_dialog.dart';
import 'package:task_notes/widgets/task_card.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  List tasksList = [
    // [task name[0], task descroption[1], taskComplited[2]]
    [
      'Make fluta[oruhbva;fhvbIJ:V pbrUIVb:fiuvb"FJIbv[O Jbuoarhnblkzdf biuzter App',
      'short description aboutefvih;fj v vuiyttctctct aoifv[O"Ifn [nnv;FUIVb:Jc aiunv KJv[9a rhmg[9er8hg [a9ergm g9 r[g98cqmg[98qh[9g a[9g8ah[ervap987reg a[98h [a9 ctctctctctctctctctvhgcdxeliyrlbvzjh .fv;abvzliur process coding',
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

  void onSave() {
    setState(() {
      tasksList.add([
        nameController.text.toString(),
        descriptionController.text.toString(),
        false
      ]);
    });
    nameController.clear();
    descriptionController.clear();
    Navigator.of(context).pop();
  }

  void onDelete(int index) {
    setState(() {
      tasksList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialogWidget(
              onSave: onSave,
              nameController: nameController,
              descriptionController: descriptionController,
            );
          });
    }

    const title = 'Tasks List';
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 201, 230),
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: ((context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => onDelete(index),
                  icon: Icons.delete,
                  backgroundColor: const Color.fromARGB(255, 196, 201, 230),
                )
              ],
            ),
            child: TaskCardWidget(
              title: tasksList[index][0],
              description: tasksList[index][1],
              taskComplited: tasksList[index][2],
              onChanged: (value) => checkBoxChanged(value, index),
            ),
          );
        }),
      ),
    );
  }
}
