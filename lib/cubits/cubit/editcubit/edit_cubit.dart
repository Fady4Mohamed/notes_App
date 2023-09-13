import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/model/noteModel.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());
 late List<noteModel> notes ;
  List<noteModel> searchednotes =[];
 List<noteModel> searchfor( String value ){
                 searchednotes.clear();
              for(int i=0;i<notes.length;i++){
                if ( notes[i].titel.toLowerCase().contains(value.toLowerCase())) {
                  searchednotes.add(notes[i]);
                 } }
              emit(Editsucsses());
return searchednotes;

 }
 void refresh(){
  
   emit(Editsucsses());
 }

}
