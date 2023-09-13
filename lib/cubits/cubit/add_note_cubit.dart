import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/model/noteModel.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

 int colorselected =Color(0xff8E3B46).value ;

  addnodefun(noteModel node){
    emit(AddNoteloding());
    try { 

  var nodesBox = Hive.box<noteModel>('thebox');
  nodesBox.add(node);
  emit(AddNotesuccess());
} catch (e) {
emit(AddNotefailer(e.toString())) ;
}
  }
}
