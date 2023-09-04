import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class VerifyOTP{

  final IAuthRepository iAuthRepository;
  VerifyOTP(this.iAuthRepository);

  Future<void> call(
    String phone, 
    void Function(PhoneAuthCredential p1) onCompleted, 
    void Function(FirebaseAuthException p1) onFailed,
    void Function(String p1, int? p2) onCodeSent,
    void Function(String p1) onTimeout,
    ) async {
    return iAuthRepository.verifyPhoneNumber(
      phone: phone, 
      onCompleted: onCompleted, 
      onFailed: onFailed, 
      onCodeSent: onCodeSent, 
      onTimeout: onTimeout
    );
  }

}