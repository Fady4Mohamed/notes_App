import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notescubit/notes_cubit.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/views/editView.dart';

import '../cubits/cubit/editcubit/edit_cubit.dart';

class notecontainer extends StatelessWidget {
  const notecontainer({
    super.key,
    required this.node,
  });
  final noteModel node;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return editviwe(
            node: node,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(node.color), borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  node.titel,
                  style: const TextStyle(fontSize: 24),
                ),
                subtitle: Text(
                  node.contante,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                    onPressed: () {
                      node.delete();
                      BlocProvider.of<NotesCubit>(context).showNotesview();
                      if (BlocProvider.of<EditCubit>(context)
                          .searchednotes
                          .contains(node)) {
                        BlocProvider.of<EditCubit>(context)
                            .searchednotes
                            .remove(node);
                        BlocProvider.of<EditCubit>(context).refresh();
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 28,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 10),
                child: Text(node.date),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
