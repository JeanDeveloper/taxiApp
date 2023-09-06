import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';
import 'package:taxi/driver/domain/repositories/iregister_repository.dart';

class GetModels{

  final IRegisterRepository iRegisterRepository;
  GetModels(this.iRegisterRepository);
  Future<Either<Failure, List<ModelVehicle>>> call() async {
    return iRegisterRepository.getModels();
  }

}