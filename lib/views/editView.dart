import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notescubit/notes_cubit.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/widgets/appbar.dart';
import 'package:note_app/widgets/localtextfeild.dart';

import '../widgets/editcolorlist.dart';

class editviwe extends StatelessWidget {
  const editviwe({super.key, required this.node});
  final noteModel node;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 79, 79),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            localAppBar(
              title: 'edit',
              icon: Icons.check,
              onTap: () {
                node.save();

                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).showNotesview();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            localtextfeild(
              hint: node.titel,
              onChanged: (String? p0) {
                node.titel = p0 ?? node.titel;
              },
            ),
            const SizedBox(height: 20),
            localtextfeild(
              hint: node.contante,
              maxLines: 7,
              onChanged: (String? p0) {
                node.contante = p0 ?? node.contante;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            editcolorlist(
              initialcolor: node.color,
              note: node,
            )
          ],
        ),
      ),
    );
  }
}
