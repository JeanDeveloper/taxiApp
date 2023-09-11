// import 'package:dartz/dartz.dart';
// import 'package:taxi/app/core/errors/failure.dart';

// import 'package:firebase_auth/firebase_auth.dart';

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/entities/upload_file_response.dart';

abstract class IAuthRepository{

  Future<void> sendOTP(
    {
      required String phone,
      required void Function(PhoneAuthCredential p1) onCompleted,
      required void Function(FirebaseAuthException p1) onFailed,
      required void Function(String p1, int? p2) onCodeSent,
      required void Function(String p1) onTimeout,
    }
  );

  Future<UserCredential?> verifyOTP(String codeNumber, String verification);
  
  Future<Either<Failure, UploadFileResponse?>> uploadFile(File file ) ;
}