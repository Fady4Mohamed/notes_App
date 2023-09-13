import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notescubit/notes_cubit.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/views/serchview.dart';
import 'package:note_app/widgets/appbar.dart';
import 'package:note_app/widgets/customButtonshet.dart';
import 'package:note_app/widgets/noteslist.dart';

class notespage extends StatelessWidget {
  const notespage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).showNotesview();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const customshet();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 35, 214, 175),
      ),
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<noteModel> notesList =
              BlocProvider.of<NotesCubit>(context).notes!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                localAppBar(
                  title: 'Notes',
                  icon: Icons.search,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SearchPage(nots: notesList);
                      },
                    ));
                  },
                ),
                NotesList(notelist: notesList),
              ],
            ),
          );
        },
      ),
    );
  }
}
