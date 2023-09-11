import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class UploadingFileCU{

  final IAuthRepository authRepository;
  UploadingFileCU(this.authRepository);

  Future<Either<Failure, String?>> call( File file) async {
    return await authRepository.uploadFile(file);
  }

}