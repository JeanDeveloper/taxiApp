// import 'package:dartz/dartz.dart';
// import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/data/datasource/auth_datasource.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class FirebaseAuthRepository extends IAuthRepository{

  final IAuthDataSource authDataSource;
  FirebaseAuthRepository(this.authDataSource);
  
  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async  {
    
    final loginResponse = await authDataSource.verifyPhoneNumber(phoneNumber);

    // on AuthException catch(auth){
    //   return Left(AuthFailure(message: auth.message ));
    // } 

    // on ServerException {
    //   return Left(ServerFailure(message: "Ha ocurrido un problema en el servidor"));
    // } 

  }

}