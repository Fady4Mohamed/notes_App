import 'package:flutter/material.dart';

class localAppBar extends StatelessWidget {
  const localAppBar({super.key, required this.title, this.icon, this.onTap});
  final String title;
  final IconData? icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        icon != null
            ? GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withOpacity(.04)),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
