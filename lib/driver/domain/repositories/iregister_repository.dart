import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/app/domain/entities/drive.dart';
import 'package:taxi/app/domain/entities/iuser.dart';
import 'package:taxi/app/domain/entities/payout.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';

abstract class IRegisterRepository{
  Future<Either<Failure, List<ModelVehicle>>> getModels();
  Future<Either<Failure, List<ColorVehicle>>> getColors();
  Future<Either<Failure, void>> registerData(IUser user, Drive drive, Payout payout);
}