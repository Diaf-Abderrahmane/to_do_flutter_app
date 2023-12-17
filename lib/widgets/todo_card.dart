// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/main.dart';

class Todocard extends StatelessWidget {
  const Todocard(
      {Key? key,
      required this.index,
      required this.vartitle,
      required this.doneOrNot,
      required this.delete,
      required this.changeStatus})
      : super(key: key);

  final String vartitle;
  final bool doneOrNot;
  final int index;
  final Function delete;
  final Function changeStatus;

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
                decoration: doneOrNot
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: doneOrNot ? Colors.black : Colors.white,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    changeStatus(index);
                  },
                  child: Icon(
                    doneOrNot ? Icons.check : Icons.close,
                    color: doneOrNot ? Colors.green : Colors.red,
                    size: 27,
                  ),
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
