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
  bool status;

  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [
    Task(title: "title 1", status: true),
    Task(title: "title 2", status: true),
    Task(title: "title 3", status: true),
    Task(title: "title 4", status: true),
    Task(title: "lets go", status: true),
  ];
  final myController = TextEditingController();

  newTask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
      // myText = myController.text;
    });
  }

  deleteTask(int index) {
    setState(() {
      allTasks.remove(allTasks[index]);
    });
  }

  deleteAllTasks() {
    setState(() {
      allTasks.clear();
    });
  }

  int calculateCompletedTasks() {
    int completedTasks = 0;

    for (var item in allTasks) {
      if (item.status) {
        completedTasks++;
      }
    }

    return completedTasks;
  }

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
                        maxLength: 20,
                        decoration: InputDecoration(hintText: "Add new Task"),
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
          actions: [
            IconButton(
              onPressed: () {
                deleteAllTasks();
              },
              icon: Icon(Icons.delete_forever),
              iconSize: 32,
              color: Colors.red[400],
            ),
          ],
          elevation: 0,
          title: Text(
            "TO DO APP",
            style: TextStyle(
                fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(58, 66, 86, 0.1),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Counter(
                allTodos: allTasks.length,
                allCompleted: calculateCompletedTasks(),
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber[100],
                ),
                height: 500,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Todocard(
                        delete: deleteTask,
                        index: index,
                        vartitle: allTasks[index].title,
                        doneOrNot: allTasks[index].status,
                      );
                    }),
              ),
              // ...allTasks.map((item) => Todocard(
              //       vartitle: item.title,
              //       doneOrNot: item.status,
              //     ))
            ],
          ),
        ));
  }
}
