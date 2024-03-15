// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sepha_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SebhaModelAdapter extends TypeAdapter<SebhaModel> {
  @override
  final int typeId = 2;

  @override
  SebhaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SebhaModel(
      content: fields[0] as String,
      count: fields[1] as int,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SebhaModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SebhaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
