import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/main.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.allTodos, required this.allCompleted})
      : super(key: key);
  final int allCompleted;
  final int allTodos;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$allCompleted/$allTodos",
      style: TextStyle(
          fontSize: 35,
          color: allCompleted == allTodos ? Colors.green : Colors.black,
          fontWeight: FontWeight.bold),
    );
  }
}
