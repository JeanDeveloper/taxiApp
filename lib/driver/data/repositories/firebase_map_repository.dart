import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/data/datasource/geo_fire_datasource.dart';
import 'package:taxi/driver/domain/repositories/imap_repository.dart';

class FirebaseMapRepository extends IMapRepository{
  
  final IGeoFireDataSource mapDataSource;
  FirebaseMapRepository(this.mapDataSource); 

  @override
  Future<Either<Failure, void>> registerLocation(String id, double lt, double lng) async {
    try {
      final position = await mapDataSource.registerLocation(id, lt, lng);
      return Right(position);
    } on Exception catch(e){
      return Left(GeneralFailure(message: e.runtimeType.toString()));
    } 
  }
  
  @override
  Future<Either<Failure, void>> deleteLocation(String id) {
    // TODO: implement deleteLocation
    throw UnimplementedError();
  }

}