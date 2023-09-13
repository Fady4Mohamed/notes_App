// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noteModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class noteModelAdapter extends TypeAdapter<noteModel> {
  @override
  final int typeId = 0;

  @override
  noteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return noteModel(
      titel: fields[0] as String,
      contante: fields[1] as String,
      date: fields[2] as String,
      color: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, noteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.titel)
      ..writeByte(1)
      ..write(obj.contante)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is noteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
