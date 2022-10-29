import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_notes/data/database.dart';
import 'package:task_notes/screens/new_task_alert_dialog.dart';
import 'package:task_notes/widgets/task_card.dart';
import 'package:task_notes/styles/colors.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final tasksBox = Hive.box('tasksBox');
  final TextEditingController nameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  TasksDataBase db = TasksDataBase();

  @override
  void initState() {
    if (tasksBox.get('TASKSLIST') == null) {
      db.createInitData();
    } else {
      db.loadDataFromDatabase();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.tasksList[index][2] = !db.tasksList[index][2];
    });
    db.updateDataBase();
  }

  void onSave() {
    setState(() {
      db.tasksList.add([
        nameController.text.toString(),
        descriptionController.text.toString(),
        false
      ]);
    });
    db.updateDataBase();
    nameController.clear();
    descriptionController.clear();
    Navigator.of(context).pop();
  }

  void onDelete(int index) {
    setState(() {
      db.tasksList.removeAt(index);
    });
    db.updateDataBase();
  }

  void onCancel() {
    nameController.clear();
    descriptionController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialogWidget(
              onSave: onSave,
              onCancel: onCancel,
              nameController: nameController,
              descriptionController: descriptionController,
            );
          });
    }

    const title = 'Tasks List';
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        backgroundColor: AppColors.appBarColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: db.tasksList.length,
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
              title: db.tasksList[index][0],
              description: db.tasksList[index][1],
              taskComplited: db.tasksList[index][2],
              onChanged: (value) => checkBoxChanged(value, index),
            ),
          );
        }),
      ),
    );
  }
}
