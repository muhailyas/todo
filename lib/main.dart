import 'package:flutter/material.dart';
import 'package:todo_using_api/screens/main_page/main_page.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      home: MainPage(),
    );
  }
}
