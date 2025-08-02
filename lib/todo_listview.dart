import 'package:flutter/material.dart';

class TodoListview extends StatelessWidget{
  const TodoListview({super.key, required this.listItemName});

  final String listItemName;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple,
              ),
              padding: EdgeInsets.all(20),     
              child: Text(
                listItemName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),),
            ),
          );
}
}