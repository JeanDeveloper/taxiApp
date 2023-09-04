// import 'package:dartz/dartz.dart';
// import 'package:taxi/app/core/errors/failure.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository{
  // Future<void> verifyPhoneNumber(String phoneNumber);

  Future<void> verifyPhoneNumber(
    {
      required String phone,
      required Function(PhoneAuthCredential p1) onCompleted,
      required Function(FirebaseAuthException p1) onFailed,
      required Function(String p1, int? p2) onCodeSent,
      required Function(String p1) onTimeout,
    }
  );

}