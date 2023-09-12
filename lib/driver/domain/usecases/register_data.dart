import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/app/domain/entities/drive.dart';
import 'package:taxi/app/domain/entities/iuser.dart';
import 'package:taxi/app/domain/entities/payout.dart';
import 'package:taxi/driver/domain/repositories/iregister_repository.dart';

class RegisterData{
  final IRegisterRepository iRegisterRepository;
  RegisterData(this.iRegisterRepository);
  Future<Either<Failure, void>> call(IUser user, Drive drive, Payout payout) async {
    return iRegisterRepository.registerData(user, drive, payout);
  }
}