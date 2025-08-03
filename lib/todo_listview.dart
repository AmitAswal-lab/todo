import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoListview extends StatelessWidget {
  const TodoListview({
    super.key,
    required this.todoItem,
    required this.ontapCheckBox,
  });

  final TodoModel todoItem;
  final Function(bool?)? ontapCheckBox;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 16, right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple,
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: todoItem.tick, 
              onChanged: ontapCheckBox,
              side: BorderSide(color: Colors.white),
              checkColor: Colors.black,
              activeColor: Colors.white,),
            Text(
              todoItem.todo,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18,
                decoration: todoItem.tick ? TextDecoration.lineThrough : TextDecoration.none,
                decorationColor: Colors.white,
                decorationThickness: 2),               
            ),
          ],
        ),
      ),
    );
  }
}
