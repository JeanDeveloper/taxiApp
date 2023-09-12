// import 'package:taxi/app/domain/entities/iuser.dart';
// import 'package:taxi/app/domain/repositories/ilocal_storage_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/app/domain/repositories/ilocation_repository.dart';

class GetingLocation{
  
  final ILocationRepository locationRepository;
  GetingLocation(this.locationRepository);

  Future<Either<Failure,Position>> call() async {
    return await locationRepository.getCurrentLocation();
  }

}