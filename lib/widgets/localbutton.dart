import 'package:flutter/material.dart';

class localbutton extends StatelessWidget {
  const localbutton({required this.name, required this.onTap});
  final String name;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: const Color.fromARGB(255, 35, 214, 175),
        ),
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text("$name",
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 248, 250, 253),
              )),
        ),
      ),
    );
  }
}
