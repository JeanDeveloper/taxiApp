import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class SendingOTP{

  final IAuthRepository iAuthRepository;
  SendingOTP(this.iAuthRepository);

  Future<void> call ( 
    String phone, 
    void Function(PhoneAuthCredential) onCompleted, 
    void Function(FirebaseAuthException) onFailed,
    void Function(String, int?) onCodeSent,
    void Function(String) onTimeout 
  ) async {
    await iAuthRepository.sendOTP(
      phone: phone, 
      onCompleted: onCompleted, 
      onFailed: onFailed, 
      onCodeSent: onCodeSent, 
      onTimeout: onTimeout
    );
    // String? resp = await iAuthRepository.sendOTP(phone);
    // return resp;
  }

}