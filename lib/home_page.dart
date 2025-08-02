import 'package:flutter/material.dart';
import 'package:todo/todo_listview.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  final List todoList = [
    ["Morning run", false],
    ["Quit coffee", false],
    ["master keys in Flutter", false]
  ];

  void checkboxChanged(int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Center(child: Text('Todo')),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index){
          return TodoListview(
            listItemName: todoList[index][0],
            tick: todoList[index][1],
            ontapCheckBox: (value) => checkboxChanged(index));
      }),
    );
  }
}