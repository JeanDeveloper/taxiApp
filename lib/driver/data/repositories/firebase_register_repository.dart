
import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/exceptions.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/data/datasource/register_datasource.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';
import 'package:taxi/driver/domain/repositories/iregister_repository.dart';

class FirebaseRegisterRepository extends IRegisterRepository{

  final IRegisterDataSource registerDataSource;
  FirebaseRegisterRepository(this.registerDataSource);

  @override
  Future<Either<Failure, List<ModelVehicle>>> getModels() async {
    try {
      final response = await registerDataSource.getModels();
      return Right(response);
    }on AuthException catch(auth){
      return Left(AuthFailure(message: auth.message ));
    } on ServerException {
      return const Left(ServerFailure(message: "Ha ocurrido un problema en el servidor"));
    } 
  }

  @override
  Future<Either<Failure, List<ColorVehicle>>> getColors() async {
    try {
      final response = await registerDataSource.getColors();
      return Right(response);
    }on AuthException catch(auth){
      return Left(AuthFailure(message: auth.message ));
    } on ServerException {
      return const Left(ServerFailure(message: "Ha ocurrido un problema en el servidor"));
    } 
  }

}