import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/failure.dart';
// import 'package:taxi/app/domain/entities/location_data.dart';

abstract class ILocationRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
  // Future<LocationData> updateLocation();
  // Future<Position> getCurrentLocation();
}
