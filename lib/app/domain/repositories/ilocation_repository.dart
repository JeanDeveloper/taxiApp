import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/failure.dart';

abstract class ILocationRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
}
