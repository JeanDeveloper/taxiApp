import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class VerifingOTP {

  final IAuthRepository authRepository;
  VerifingOTP(this.authRepository);

  Future<void> call( String codeNumber, String verification) async {
    await authRepository.verifyOTP(codeNumber, verification);
  }

}