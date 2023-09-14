import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';

abstract class IMapRepository{
  Future<Either<Failure, void>> registerLocation(String id, double lt, double lng);
  Future<Either<Failure, bool>> deleteLocation(String id);
}
