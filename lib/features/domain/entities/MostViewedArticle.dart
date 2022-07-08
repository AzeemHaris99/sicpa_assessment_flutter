import 'package:equatable/equatable.dart';

class MostViewedArticle extends Equatable {
  final int id;

  final String title;

  final String date;

  const MostViewedArticle({
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
