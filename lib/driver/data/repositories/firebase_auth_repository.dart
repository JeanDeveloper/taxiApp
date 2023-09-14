import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/core/constants/constants.dart';
import 'package:taxi/driver/data/datasource/auth_datasource.dart';
import 'package:taxi/driver/domain/entities/upload_file_response.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class FirebaseAuthRepository extends IAuthRepository{

  final IAuthDataSource authDataSource;
  FirebaseAuthRepository(this.authDataSource);

  @override
  Future<void> sendOTP({
    required String phone, 
    required void Function(PhoneAuthCredential p1) onCompleted, 
    required void Function(FirebaseAuthException p1) onFailed, 
    required void Function(String p1, int? p2) onCodeSent, 
    required void Function(String p1) onTimeout
  }) async {
    await authDataSource.sendingOTP(
      phone,
      onCompleted: onCompleted, 
      onFailed: onFailed, 
      onCodeSent: onCodeSent, 
      onTimeout: onTimeout
    );
  }
  
  @override
  Future<UserCredential?> verifyOTP(String codeNumber, String verification) async {
    UserCredential? user = await authDataSource.verifyOTP(codeNumber, verification);
    return user;
  }

  @override
  Future<Either<Failure, UploadFileResponse?>> uploadFile(File file, PhotoType phototype) async {

    try {
      final response = await authDataSource.uploadFile(file, phototype);
      return Right(response);
    }on Exception catch(ex){
      return Left(AuthFailure(message: ex.toString() ));
    }

  }
  
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await authDataSource.logout();
      return const Right(true);
    } on Exception catch(ex){
      return Left(AuthFailure(message: ex.toString() ));
    }
  }

}