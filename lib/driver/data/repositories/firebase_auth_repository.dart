// import 'package:dartz/dartz.dart';
// import 'package:taxi/app/core/errors/failure.dart';
// import 'package:firebase_auth_platform_interface/src/providers/phone_auth.dart';
// import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:firebase_auth_platform_interface/src/providers/phone_auth.dart';
import 'package:taxi/driver/data/datasource/auth_datasource.dart';
import 'package:taxi/driver/domain/repositories/iauth_repository.dart';

class FirebaseAuthRepository extends IAuthRepository{

  final IAuthDataSource authDataSource;
  FirebaseAuthRepository(this.authDataSource);

   
  // @override
  // Future<String?> sendOTP( String phone ) async {
  //   String? resp = await authDataSource.sendingOTP(phone);
  //   return resp;
  // }

  @override
  Future<void> sendOTP(
    {
      required String phone, 
      required void Function(PhoneAuthCredential p1) onCompleted, 
      required void Function(FirebaseAuthException p1) onFailed, 
      required void Function(String p1, int? p2) onCodeSent, 
      required void Function(String p1) onTimeout
    }
    ) async {
      await authDataSource.sendingOTP(
        phone, 
        onCompleted: onCompleted, 
        onFailed: onFailed, 
        onCodeSent: onCodeSent, 
        onTimeout: onTimeout
      );
  }
  
  @override
  Future<void> verifyOTP(String codeNumber, String verification) async {
    await authDataSource.verifyOTP(codeNumber, verification);
  }


  // @override
  // Future<void> verifyPhoneNumber(
  //   {
  //     required String phone, 
  //     required Function(PhoneAuthCredential p1) onCompleted, 
  //     required Function(FirebaseAuthException p1) onFailed, 
  //     required Function(String p1, int? p2) onCodeSent, 
  //     required Function(String p1) onTimeout
  //   }
  // ) async {

  //   await authDataSource.verifyPhoneNumber(
  //     phone, 
  //     onCompleted: onCompleted, 
  //     onFailed: onFailed, 
  //     onCodeSent: onCodeSent, 
  //     onTimeout: onTimeout
  //   );

  // }
  
  // @override
  // Future<void> verifyPhoneNumber(String phoneNumber) async  {
    
  //   await authDataSource.verifyPhoneNumber(phoneNumber);

  //   // on AuthException catch(auth){
  //   //   return Left(AuthFailure(message: auth.message ));
  //   // } 

  //   // on ServerException {
  //   //   return Left(ServerFailure(message: "Ha ocurrido un problema en el servidor"));
  //   // } 

  // }




}