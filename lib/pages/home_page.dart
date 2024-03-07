import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/widgets/to_do_tile.dart';

import '../colors/app_colors.dart';
import '../widgets/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, bool> toDoTask = {
    "Wash my clothes" : false,
    "Code in the evening": false,
    "Visit Kimaru" : false,
    "Hiking" : false,
    "Go to the gym" : false,
    "Read a book" : false,
  };

  void saveNewTask (){
    setState(() {
      toDoTask[myController.text] = false;
      myController.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return DialogBox(
          controller: myController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  void deleteTask(int index){
    setState(() {
      toDoTask.remove(toDoTask.keys.elementAt(index));
    });
  }

  void onChanged (bool value, int index){
    setState(() {
      toDoTask[toDoTask.keys.elementAt(index)] = !toDoTask.values.elementAt(index);
    });
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          toolbarHeight: 70,
          title: const Center(child: Text('To Do', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            height: 600,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: toDoTask.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                return Expanded(child: ToDoTile(text: toDoTask.keys.elementAt(index) ,value: toDoTask.values.elementAt(index), onChanged: (value) => onChanged(value!, index), onPressed: (context) => deleteTask(index),));
              },
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: AppColors.appBarColor,
          child: const Icon(Icons.add),
        )
      ),
    );
  }
}
