import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class ResultShowingWidget extends StatelessWidget {
  const ResultShowingWidget(
      {super.key, required this.headTitle, required this.notes});
  final String headTitle;
  final String notes;

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
            Text(
              headTitle,
              style: const TextStyle(color: Colors.white, fontSize: 23),
            ),
            kHeight10,
            Text(
              notes,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
