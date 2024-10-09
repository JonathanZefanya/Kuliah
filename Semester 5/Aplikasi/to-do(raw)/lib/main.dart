import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../views/addTodo.dart';
import '../views/todoList.dart';
import '../utils/DbHelper.dart';
import '../views/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DbHelper();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var db = DbHelper();

  void add(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void delete(int id) async {
    await db.deleteTodo(id);
    setState(() {});
  }

  void checked(int id, bool value) async {
    await db.isCheckedTodo(id, value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App"),
      ),
      body: Column(
        children: [
          TodoList(
            deleteFunction: delete,
            isChacked: checked,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => addTodo(insertFunction: add),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
