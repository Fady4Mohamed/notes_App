part of 'add_note_cubit.dart';




@immutable
sealed class AddNoteState {}



final class AddNoteInitial extends AddNoteState {}
final class AddNoteloding extends AddNoteState {}
final class AddNotesuccess extends AddNoteState {}
final class AddNotefailer extends AddNoteState {
  final String erro;

  AddNotefailer(this.erro);

}
