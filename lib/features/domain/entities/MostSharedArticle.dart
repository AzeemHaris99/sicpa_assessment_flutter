import 'package:equatable/equatable.dart';

class MostSharedArticle extends Equatable {
  final int id;

  final String title;

  final String date;

  const MostSharedArticle({
    required this.id,
    required this.title,
    required this.date,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id, title, date];
  }

  @override
  bool get stringify => true;
}
