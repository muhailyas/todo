import 'package:flutter/material.dart';
import 'package:todo_using_api/api/api_service.dart';
import 'package:todo_using_api/constants/constants.dart';
import '../../api/model.dart';
import 'widgets/result_show_widget.dart';

ValueNotifier<List<Todo>> allDatas = ValueNotifier<List<Todo>>([]);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  void getDatas() async {
    final todos = await TodoApi().fetchTodos();
    allDatas.value = todos;
  }

  @override
  Widget build(BuildContext context) {
    getDatas();
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
        child: ValueListenableBuilder(
            valueListenable: allDatas,
            builder: (context, value, _) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  var data = value[index];
                  return ResultShowingWidget(
                    todo: data,
                  );
                },
                itemCount: value.length,
                separatorBuilder: (context, index) => kHeight20,
              );
            }),
      ),
    );
  }
}
