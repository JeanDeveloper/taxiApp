import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthDataSource{
  Future<void> verifyPhoneNumber(
    String phone,{
      Function(PhoneVerificationCompleted) onCompleted,
      Function(PhoneVerificationFailed) onFailed,
      Function(PhoneCodeSent, String verificationId) onCodeSent,
      Function(String verificationId) onTimeout,
    }
  );



}

class FirebaseDataSource extends IAuthDataSource{

  final _firebaseAuth = FirebaseAuth.instance;
  
  @override
  Future<void> verifyPhoneNumber( String phone ) async {

    // await _firebaseAuth.verifyPhoneNumber(
    //   phoneNumber: "+51919476763",

    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     // ANDROID ONLY!
    //     // Sign the user in (or link) with the auto-generated credential
    //     print("verificacion completada");
    //     await _firebaseAuth.signInWithCredential(credential);
    //   },

    //   verificationFailed: (FirebaseAuthException e) {
    //     if(e.code == 'invalid-phone-number'){
    //       print("Numero incorrecto ${e.message}");
    //     }
        
    //     print("codigo del fallo: ${e.message}");
    //   },

    //   codeSent: (String verificationId, int? resendToken) async {
    //     print("Se envio el codigo exitosamente");
    //     // Update the UI - wait for the user to enter the SMS code
    //     String smsCode = '123456';

    //     // Create a PhoneAuthCredential with the code
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    //       // Sign the user in (or link) with the credential
    //     await _firebaseAuth.signInWithCredential(credential);
    //   },

    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     print(verificationId);
    //   },
      
    // );

  }
  
}