// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/main.dart';

class Todocard extends StatelessWidget {
  const Todocard(
      {Key? key,
      required this.index,
      required this.vartitle,
      required this.delete,
      required this.author})
      : super(key: key);

  final String vartitle;
  final String author;
  final int index;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromRGBO(58, 66, 86, 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vartitle,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.black),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
