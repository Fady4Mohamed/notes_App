import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../model/noteModel.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<noteModel>? notes;
  showNotesview(){
  var nodesBox = Hive.box<noteModel>('thebox');
   notes= nodesBox.values.toList();
   emit(Notesuccess());
  }
}
