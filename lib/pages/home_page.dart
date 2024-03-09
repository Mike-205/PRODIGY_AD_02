import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/provider/task_data.dart';
import 'package:prodigy_ad_02/widgets/to_do_tile.dart';
import 'package:provider/provider.dart';

import '../colors/app_colors.dart';
import '../widgets/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void onSaved (){
    Provider.of<TaskData>(context, listen: false).addTask(myController.text);
    myController.clear();
    Navigator.of(context).pop();
  }

  void onCancelled (){
    myController.clear();
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return DialogBox(
          controller: myController,
          onSave: onSaved,
          onCancel: onCancelled
        );
      }
    );
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
          child: SizedBox(
            height: 600,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: Provider.of<TaskData>(context).toDoTask.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                String key = Provider.of<TaskData>(context).toDoTask.keys.elementAt(index);
                return ToDoTile(
                    text: key,
                    value: Provider.of<TaskData>(context).toDoTask[key]!,
                    onChanged: (value){
                      Provider.of<TaskData>(context, listen: false).toggleTask(key);
                    },
                    onPressed: (context){
                      Provider.of<TaskData>(context, listen: false).deleteTask(key);
                    }
                );
              },
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          elevation: 2,
          backgroundColor: AppColors.appBarColor,
          child: const Icon(Icons.add),
        )
      ),
    );
  }
}

