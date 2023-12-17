// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/main.dart';

class Todocard extends StatelessWidget {
  const Todocard(
      {Key? key,
      required this.index,
      required this.vartitle,
      required this.doneOrNot,
      required this.delete})
      : super(key: key);

  final String vartitle;
  final bool doneOrNot;
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
        child: Row(
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
              children: [
                IconButton(
                  onPressed: () {
                    if (!doneOrNot) {}
                  },
                  icon: Icon(doneOrNot ? Icons.check : Icons.close),
                  color: doneOrNot ? Colors.green : Colors.red,
                  iconSize: 27,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
