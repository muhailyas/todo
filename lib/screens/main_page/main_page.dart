import 'package:flutter/material.dart';
import 'package:todo_using_api/screens/add/screen_new_add.dart';
import 'package:todo_using_api/screens/home/screen_home.dart';
import 'package:todo_using_api/widgets/widgets.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List bodies = [ const ScreenHome(), ScreenNewAdd()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, index, child) {
          return bodies[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    ));
  }
}
