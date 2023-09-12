import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/core/constants/constants.dart';
import 'package:taxi/driver/domain/entities/upload_file_response.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class UploadingFileCU{

  final IAuthRepository authRepository;
  UploadingFileCU(this.authRepository);

  Future<Either<Failure, UploadFileResponse?>> call( File file, PhotoType photoType) async {
    return await authRepository.uploadFile(file, photoType);
  }

}