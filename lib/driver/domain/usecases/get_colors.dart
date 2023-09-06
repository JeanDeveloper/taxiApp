import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/repositories/iregister_repository.dart';

class GetColors{

  final IRegisterRepository iRegisterRepository;
  GetColors(this.iRegisterRepository);
  Future<Either<Failure, List<ColorVehicle>>> call() async {
    return iRegisterRepository.getColors();
  }

}