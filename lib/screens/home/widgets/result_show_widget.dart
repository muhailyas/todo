// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:todo_using_api/api/api_service.dart';
import 'package:todo_using_api/api/model.dart';
import 'package:todo_using_api/screens/home/screen_home.dart';
import '../../../constants/constants.dart';
import '../../add/textfieldwidget.dart';

class ResultShowingWidget extends StatefulWidget {
  const ResultShowingWidget({super.key, required this.todo});
  final Todo todo;

  @override
  State<ResultShowingWidget> createState() => _ResultShowingWidgetState();
}

class _ResultShowingWidgetState extends State<ResultShowingWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    descriptionController =
        TextEditingController(text: widget.todo.description);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 45, 197, 172),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.todo.title,
                  style: const TextStyle(color: Colors.white, fontSize: 23),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        updateTodo(context, widget.todo);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteTodo(widget.todo);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                )
              ],
            ),
            kHeight10,
            Text(
              widget.todo.description,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  void updateTodo(BuildContext context, Todo todo) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 400,
          width: double.infinity,
          color: Colors.black.withOpacity(0.95),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight10,
                  TextFieldWidget(
                    hintText: "Title",
                    controller: titleController!,
                    height: 75,
                  ),
                  kHeight10,
                  TextFieldWidget(
                    hintText: "Description",
                    maximumLine: 6,
                    height: 170,
                    controller: descriptionController!,
                  ),
                  kHeight20,
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 45, 197, 172)),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(255, 45))),
                          onPressed: () {
                            validate(context, todo);
                          },
                          child: const Text(
                            "Update Changes",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void deleteTodo(Todo todo) async {
    try {
      await TodoApi().deleteTodo(todo);
      allDatas.notifyListeners();
    } catch (e) {
      print("Error deleting todo:$e");
    }
  }

  void validate(BuildContext context, Todo todo) async {
    if (formKey.currentState!.validate()) {
      todo.title = titleController!.text;
      todo.description = descriptionController!.text;
      await TodoApi().updateTodo(todo);
      allDatas.notifyListeners();
      Navigator.pop(context);
    }
  }
}
