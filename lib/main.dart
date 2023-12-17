// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/widgets/counter.dart';
import 'package:to_do_flutter_app/widgets/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  String author;

  Task({
    required this.title,
    required this.author,
  });
}

class _TodoAppState extends State<TodoApp> {
  final myController = TextEditingController();
  final authorController = TextEditingController();
  List allTasks = [
    Task(title: "title 1", author: "samaykm"),
    Task(title: "title 2", author: "samaykm"),
    Task(title: "title 3", author: "samaykm"),
    Task(title: "title 4", author: "ABDOU"),
    Task(title: "lets go", author: "samaykm"),
  ];

  newTask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, author: authorController.text),
      );
      // myText = myController.text;
    });
  }

  deleteTask(int index) {
    setState(() {
      allTasks.remove(allTasks[index]);
    });
  }

  //  deleteAllTasks() {
  //   setState(() {
  //     allTasks.clear();
  //   });
  // }

  // int calculateCompletedTasks() {
  //   int completedTasks = 0;

  //   for (var item in allTasks) {
  //     if (item.status) {
  //       completedTasks++;
  //     }
  //   }

  //   return completedTasks;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              clipBehavior: Clip
                  .antiAliasWithSaveLayer, // add this in order for the radius to apply
              // isScrollControlled: true, || similar to height: double.infinity ( fills the entire height of the screen)
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(40),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.blueGrey[100],
                  child: Column(
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(hintText: "New Quote"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: authorController,
                        maxLength: 20,
                        decoration: InputDecoration(hintText: "Author"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            newTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            color: Colors.blueGrey,
            size: 32,
          ),
        ),
        backgroundColor: Colors.amber[200],
        // backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Best Quotes",
            style: TextStyle(
                fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(58, 66, 86, 0.1),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Column(
                    children: [
                      ...List.generate(allTasks.length, (index) {
                        // 'index' represents the index of the current item in the 'allTasks' list
                        return Todocard(
                          delete: deleteTask,
                          index: index,
                          author: allTasks[index].author,
                          vartitle: allTasks[index].title,
                        );
                      }),
                    ],
                  ),
                  // child: ListView.builder(
                  //     itemCount: allTasks.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Todocard(
                  //         delete: deleteTask,
                  //         index: index,
                  //         author: allTasks[index].author,
                  //         vartitle: allTasks[index].title,
                  //       );
                  //     }),
                ),
                // ...allTasks.map((item) => Todocard(
                //       vartitle: item.title,
                //       doneOrNot: item.status,
                //     ))
              ],
            ),
          ),
        ));
  }
}
