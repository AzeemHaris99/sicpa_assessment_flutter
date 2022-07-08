// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_emailed_article_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MostEmailedArticleModelAdapter
    extends TypeAdapter<MostEmailedArticleModel> {
  @override
  final int typeId = 2;

  @override
  MostEmailedArticleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MostEmailedArticleModel(
      id: fields[0] as int,
      title: fields[1] as String,
      date: fields[2] as String
    );
  }

  @override
  void write(BinaryWriter writer, MostEmailedArticleModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostEmailedArticleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
