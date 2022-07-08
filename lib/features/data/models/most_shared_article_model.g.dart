// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_shared_article_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MostSharedArticleModelAdapter
    extends TypeAdapter<MostSharedArticleModel> {
  @override
  final int typeId = 1;

  @override
  MostSharedArticleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MostSharedArticleModel(
        id: fields[0] as int,
        title: fields[1] as String,
        date: fields[2] as String
    );
  }

  @override
  void write(BinaryWriter writer, MostSharedArticleModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostSharedArticleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
