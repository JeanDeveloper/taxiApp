
import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';

abstract class IRegisterRepository{

  Future<Either<Failure, List<ModelVehicle>>> getModels();
  Future<Either<Failure, List<ColorVehicle>>> getColors();

}