import 'package:flutter/material.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/widgets/noteContainer.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key, required this.notelist});
  final List<noteModel> notelist;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          itemCount: notelist.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: notecontainer(
                node: notelist[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
