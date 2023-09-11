import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

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

  Future? uploadFile(File file);

}

class FirebaseDataSource extends IAuthDataSource{

  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance.ref();
  
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
  
  @override
  Future<String?> uploadFile(File file) async {
    try { 
      final storageReference = _storage.child('sertech/sudo-app/image.jpg');
      final uploadTask = storageReference.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error al cargar el archivo: $e');
      return null;
    }
  }
  
}