import 'package:hive/hive.dart';

part 'noteModel.g.dart' ;

@HiveType(typeId: 0)
class noteModel extends HiveObject {
  @HiveField(0)
   String titel;
  @HiveField(1)
   String  contante;
  @HiveField(2)
  final String  date;
  @HiveField(3)
   int color;

  noteModel( {
  required this.titel,
  required this.contante,
  required this.date,
  required this.color});
}