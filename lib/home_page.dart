import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/todo_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<TodoModel> todoList = [
    TodoModel(todo: 'Morning run', tick: false),

    TodoModel(todo: 'Morning run', tick: false),
  ];

  final _textController = TextEditingController();

  void checkboxChanged(int index) {
    setState(() {
      final current = todoList[index];
      todoList[index] = TodoModel(todo: current.todo, tick: !current.tick);
    });
  }

  void addTodoItem() {
    if (_textController.text.trim().isEmpty) return;

    setState(() {
      todoList.add(TodoModel(todo: _textController.text.trim(), tick: false));
      _textController.clear();
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
        itemBuilder: (BuildContext context, index) {
          return Dismissible(
            key: Key(todoList[index].todo), // A unique key
            onDismissed: (direction) {
              final removedItem = todoList[index];
              final removedIndex = index;
              setState(() {
                todoList.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Todo deleted'),
                  action: SnackBarAction(
                    label: 'Undo',
                    textColor: Colors.yellow,
                    onPressed: () {
                      setState(() {
                        todoList.insert(removedIndex, removedItem);
                      });
                    },
                  ),
                  duration: Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            background: Container(
              margin: const EdgeInsets.only(
                bottom: 6,
                top: 16,
                right: 8,
                left: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(25),
              ),
            ),

            child: TodoListview(
              todoItem: todoList[index],
              ontapCheckBox: (value) => checkboxChanged(index),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 25),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hint: Text(
                      'Add new todo items',
                      style: TextStyle(fontSize: 16),
                    ),
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: addTodoItem,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
