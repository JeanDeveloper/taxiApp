import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/exceptions.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/app/domain/repositories/ilocation_repository.dart';
import 'package:taxi/driver/data/datasource/location_datasource.dart';

class GeolocatorLocationRepository implements ILocationRepository {
  
  final ILocationDataSource locationDataSource;
  GeolocatorLocationRepository(this.locationDataSource); 
  
  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {

    try {
      final position = await locationDataSource.getCurrentLocation();
      return Right(position!);
    } on LocationException catch(e){
      return Left(LocationFailure(message: e.message ));
    } 

  }

}