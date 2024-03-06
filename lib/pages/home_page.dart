import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/widgets/to_do_tile.dart';

import '../colors/app_colors.dart';

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
    "Hiking" : false
  };

  void onChanged (bool value, int index){
    setState(() {
      toDoTask[toDoTask.keys.elementAt(index)] = !toDoTask.values.elementAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        toolbarHeight: 70,
        title: const Center(child: Text('To Do', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ListView.builder(
          itemCount: toDoTask.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            return ToDoTile(text: toDoTask.keys.elementAt(index) ,value: toDoTask.values.elementAt(index), onChanged: (value) => onChanged(value!, index));
          },
        )
      )
    );
  }
}
