import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class VerifingOTP {

  final IAuthRepository authRepository;
  VerifingOTP(this.authRepository);

  Future<UserCredential?> call( String codeNumber, String verification) async {
    UserCredential? user = await authRepository.verifyOTP(codeNumber, verification);
    return user;
  }

}