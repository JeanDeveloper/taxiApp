// import 'package:dartz/dartz.dart';
// import 'package:taxi/app/core/errors/failure.dart';

abstract class IAuthRepository{
  Future<void> verifyPhoneNumber(String phoneNumber);
  // Future<void> signInWithPhoneNumber(String verificationId, String smsCode);
}