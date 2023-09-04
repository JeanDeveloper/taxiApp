// import 'package:dartz/dartz.dart';
// import 'package:taxi/app/core/errors/failure.dart';

// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository{
  // Future<void> verifyPhoneNumber(String phoneNumber);

  Future<void> sendOTP(
    {
      required String phone,
      required void Function(PhoneAuthCredential p1) onCompleted,
      required void Function(FirebaseAuthException p1) onFailed,
      required void Function(String p1, int? p2) onCodeSent,
      required void Function(String p1) onTimeout,
    }
  );

  // Future<String?> sendOTP(String phone);
  Future<void> verifyOTP(String codeNumber, String verification);
  

}