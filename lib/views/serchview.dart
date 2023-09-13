import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/editcubit/edit_cubit.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/widgets/localtextfeild.dart';
import '../widgets/appbar.dart';
import '../widgets/noteslist.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.nots});
  final List<noteModel> nots;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 43, 43, 43),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<EditCubit, EditState>(
          builder: (context, state) {
            BlocProvider.of<EditCubit>(context).notes = nots;
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const localAppBar(
                  title: 'search',
                ),
                const SizedBox(
                  height: 10,
                ),
                localtextfeild(
                  hint: 'search here',
                  onChanged: (p0) {
                    BlocProvider.of<EditCubit>(context).searchfor(p0);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                NotesList(
                    notelist:
                        BlocProvider.of<EditCubit>(context).searchednotes),
              ],
            );
          },
        ),
      ),
    );
  }
}
