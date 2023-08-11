import 'package:flutter/material.dart';
import 'package:todo_using_api/constants/constants.dart';
import 'widgets/result_show_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "All Notes",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) => const ResultShowingWidget(
              headTitle: "To do ", notes: "something wrong"),
          itemCount: 10,
          separatorBuilder: (context, index) => kHeight20,
        ),
      ),
    );
  }
}
