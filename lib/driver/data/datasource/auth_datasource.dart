import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthDataSource{

  Future<void> verifyPhoneNumber(String phoneNumber);

}

class FirebaseDataSource extends IAuthDataSource{

  final _firebaseAuth = FirebaseAuth.instance;
  
  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+51$phoneNumber",

      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        await _firebaseAuth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        if(e.code == 'invalid-phone-number'){
          print("Numero incorrecto ${e.message}");
        }
      },

      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await _firebaseAuth.signInWithCredential(credential);
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      },
      
    );

  }
  
}