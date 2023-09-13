import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/cubit/add_note_cubit.dart';
import 'package:note_app/cubits/cubit/notescubit/notes_cubit.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/widgets/localbutton.dart';
import 'package:note_app/widgets/localtextfeild.dart';

import 'addcolorlist.dart';

class addnodeform extends StatefulWidget {
  const addnodeform({
    super.key,
  });

  @override
  State<addnodeform> createState() => _addnodeformState();
}

class _addnodeformState extends State<addnodeform> {
  final GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, subtitel;
  final String time =
      '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNotesuccess) {
          BlocProvider.of<NotesCubit>(context).showNotesview();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteloding ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                right: 10,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 10),
            child: Form(
              key: key,
              autovalidateMode: autovalidateMode,
              child: SizedBox(
                height: 480,
                child: ListView(
                  children: [
                    localtextfeild(
                      hint: '  titel',
                      onSaved: (p0) {
                        titel = p0;
                      },
                    ),
                    const SizedBox(height: 20),
                    localtextfeild(
                      hint: '                              contante',
                      maxLines: 7,
                      onSaved: (p0) {
                        subtitel = p0;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const addcolorlist(),
                    const SizedBox(
                      height: 20,
                    ),
                    localbutton(
                        name: 'Add',
                        onTap: () {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();
                            var node = noteModel(
                                titel: titel!,
                                contante: subtitel!,
                                date: time,
                                color: BlocProvider.of<AddNoteCubit>(context)
                                    .colorselected);
                            BlocProvider.of<AddNoteCubit>(context)
                                .addnodefun(node);
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
