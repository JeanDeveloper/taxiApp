
import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/repositories/imap_repository.dart';

class RemoveLocation{
  
  final IMapRepository mapRepository;
  RemoveLocation(this.mapRepository);

  Future<Either<Failure,void>> call(String id, double lt, double lng) async {
    return await mapRepository.registerLocation(id, lt, lng);
  }

}