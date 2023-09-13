import 'package:flutter/material.dart';

class colorContainer extends StatelessWidget {
  const colorContainer(
      {super.key, required this.color, required this.isselected});
  final Color color;
  final bool isselected;
  @override
  Widget build(BuildContext context) {
    return isselected
        ? Container(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: color,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: color,
          );
  }
}
