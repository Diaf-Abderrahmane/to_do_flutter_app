// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  const Todocard({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Color.fromRGBO(58, 66, 86, 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "data",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.close,
              size: 27,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
