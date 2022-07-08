// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_viewed_article_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MostViewedArticleModelAdapter
    extends TypeAdapter<MostViewedArticleModel> {
  @override
  final int typeId = 0;

  @override
  MostViewedArticleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MostViewedArticleModel(
        id: fields[0] as int,
        title: fields[1] as String,
        date: fields[2] as String
    );
  }

  @override
  void write(BinaryWriter writer, MostViewedArticleModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostViewedArticleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
