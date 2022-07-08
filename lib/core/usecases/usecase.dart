import 'package:dartz/dartz.dart';
import 'package:sicpa_assessment_flutter/core/error/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, List<Type>>>? call();
}