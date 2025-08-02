import 'package:flutter/material.dart';
import 'package:todo/home_page.dart';

class Todo extends StatelessWidget{

  const Todo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}