import 'package:flutter/material.dart';
import 'package:todo_using_api/constants/constants.dart';
import 'textfieldwidget.dart';

class ScreenNewAdd extends StatelessWidget {
  ScreenNewAdd({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Make your todo",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight10,
                TextFieldWidget(
                  hintText: "Title",
                  controller: titleController,
                  height: 75,
                ),
                kHeight10,
                TextFieldWidget(
                  hintText: "Description",
                  maximumLine: 6,
                  height: 170,
                  controller: descriptionController,
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
                            fixedSize: MaterialStatePropertyAll(Size(255, 45))),
                        onPressed: () {
                          validate(context);
                        },
                        child: const Text(
                          "Save",
                          style:
                              TextStyle(color: Colors.white, letterSpacing: 1),
                        ),
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 45, 197, 172)),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(140, 45))),
                          onPressed: () {
                            formKey.currentState!.reset();
                          },
                          child: const Text(
                            "Clear All",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.reset();
    }
  }
}
