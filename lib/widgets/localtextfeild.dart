import 'package:flutter/material.dart';

class localtextfeild extends StatelessWidget {
  const localtextfeild(
      {this.hint, this.onSaved, this.maxLines = 1, this.onChanged});
  final String? hint;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'required feild ';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      maxLines: maxLines,
      onSaved: onSaved,
      cursorColor: const Color.fromARGB(255, 11, 11, 11),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: '$hint',
        hintStyle: const TextStyle(color: Color.fromARGB(255, 30, 30, 31)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
              width: 2, color: Color.fromARGB(255, 23, 23, 24)),
        ),
      ),
    );
  }
}
