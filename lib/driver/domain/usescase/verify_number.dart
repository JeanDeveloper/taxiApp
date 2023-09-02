import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class VerifyNumber{

  final IAuthRepository iAuthRepository;
  VerifyNumber(this.iAuthRepository);

  Future<void> call(String phoneNumber) async {
    return iAuthRepository.verifyPhoneNumber(phoneNumber);
  }

}