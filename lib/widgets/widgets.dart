import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier<int>(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: indexChangeNotifier,
        builder: (context, index, _) {
          return BottomNavigationBar(
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              selectedItemColor: Colors.white,
              currentIndex: index,
              onTap: (value) => indexChangeNotifier.value = value,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.note_alt_sharp), label: "To-dos"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.note_add_sharp), label: "add")
              ]);
        });
  }
}
