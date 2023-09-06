import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthDataSource{

  Future<void> sendingOTP(
    String phone, {
      required void Function(PhoneAuthCredential phone) onCompleted,
      required void Function(FirebaseAuthException exception) onFailed,
      required void Function(String a, int? b) onCodeSent,
      required void Function(String verificationId) onTimeout,
    }
  );

  Future<UserCredential?> verifyOTP(String codeNumber, String verification);

}

class FirebaseDataSource extends IAuthDataSource{

  final _auth = FirebaseAuth.instance;
  
  @override
  Future<UserCredential?> verifyOTP(String codeNumber, String verification) async {

    PhoneAuthCredential credential =  PhoneAuthProvider.credential(
      verificationId: verification, 
      smsCode: codeNumber
    );

    UserCredential user = await _auth.signInWithCredential(credential);

    return user;


  }

  @override
  Future<void> sendingOTP(
    String phone, 
    {
      required void Function(PhoneAuthCredential p1) onCompleted, 
      required void Function(FirebaseAuthException p1) onFailed, 
      required void Function(String p1, int? p2) onCodeSent, 
      required void Function(String verificationId) onTimeout
    }
  ) async {

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+51$phone",
        verificationCompleted: onCompleted,
        verificationFailed: onFailed,
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: onTimeout,
      );
    } catch( e ) {
      // Manejar errores aquí
      print("Hubo una exception"); 
    }

  }

  // @override
  // Future<void> verifyPhoneNumber( String phone ) async {

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

  // }
  
}