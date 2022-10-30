import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_notes/costants/count_constants.dart';
import 'package:task_notes/costants/text_constants.dart';
import 'package:task_notes/data/data_base.dart';
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
      db.firstTimeInitData();
    } else {
      db.loadDataFromDatabase();
    }

    super.initState();
  }

  void checkBoxChanged(int cardIndex) {
    setState(() {
      db.tasksList[cardIndex][IndexInDataBaseRow.isComplited] =
          !db.tasksList[cardIndex][IndexInDataBaseRow.isComplited];
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

  void onDelete(int cardIndex) {
    setState(() {
      db.tasksList.removeAt(cardIndex);
    });
    db.updateDataBase();
  }

  void onCancel() {
    nameController.clear();
    descriptionController.clear();
    Navigator.of(context).pop();
  }

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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text(TextConstants.title),
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
        itemBuilder: ((context, cardIndex) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => onDelete(cardIndex),
                  icon: Icons.delete,
                  backgroundColor: AppColors.bgColor,
                )
              ],
            ),
            child: TaskCardWidget(
              title: db.tasksList[cardIndex][IndexInDataBaseRow.taskName],
              description: db.tasksList[cardIndex]
                  [IndexInDataBaseRow.taskDescroption],
              taskComplited: db.tasksList[cardIndex]
                  [IndexInDataBaseRow.isComplited],
              onChanged: (value) => checkBoxChanged(cardIndex),
            ),
          );
        }),
      ),
    );
  }
}
