import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class DoLogoutCU{

  final IAuthRepository iAuthRepository;
  DoLogoutCU(this.iAuthRepository);

  Future<void> call () async {
    await iAuthRepository.logout();
  }

}