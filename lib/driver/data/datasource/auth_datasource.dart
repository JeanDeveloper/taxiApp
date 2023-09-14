import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart' ;
import 'package:http/http.dart' as http;
import 'package:taxi/driver/core/constants/constants.dart';
import 'package:taxi/driver/data/models/upload_file_model.dart';
import 'package:taxi/driver/domain/entities/upload_file_response.dart';

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

  Future<UploadFileResponse?> uploadFile(File file, PhotoType photoType);

  Future<void> logout();

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
  
  @override
  Future<UploadFileResponse?> uploadFile(File file, photoType) async {

    // final jsonCredentials = File('rock-verbena.json');
    final credentials = ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "project_id": "rock-verbena-359222",
      "private_key_id": "b5c2aa14735a1910a9ee005e7fc56edd2bf6ae37",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCZ8PDuyD2i3WQy\nPwo7hrOODvu2+iFGQyzsJXsi0UL5JuyChQ49Ki1PlvgA6sTNbgGSDw+YhST+7mkc\nbx04kJIkNz/kyqvtlj/S0AO577XTCqcb6z1Zo+Jb6oPWIQf5RrFyXbR08+/PhL7M\nNw8PvN9x5poliOU+CB+r/NCVQDA3+eQxVCxOAIeYtAUwKv24lWnkne20uo3uvhn8\nv8vcwF25R0sI4NxnNrtoiicyhHUsCDjwsrdid4c9uT2eP6YaI1gcHGCDClrDIBao\niXaLgyFDinM2aoTpWBlRSLte5bTRaCJFwFEFEjisGC9A9HIXgabvdA9rk1SUeaOw\nmpVtJ84vAgMBAAECggEAE9hILvgYXgT9VC7lQkw4nHEZCPsQzA5/3Ydtas0gPZ9D\ncQX3EnJ7+d0j5nZdXYA3ap1PbOGJJeYVHcnDMhYNCOcocPWhmVS7sJEJUfBxd53R\nchtuwr4KQcAnM7T5Yqy21l/3EfaabR2XPRtB8UzvXy8ToxAVQVxpvNGwD/WA4c49\nYH7WY2hu5ANhUB8/rm/fG0eR0pwNMeGKFnZs8j51VZE3/P7mfSsvlIE4uRIbeUaI\nYYC8DEqhe0ZHG5WOZ+y40YuudlV0D5hkTZlmeMFTsU5QkPKHoB9GHYHlpJrx5OBb\nn70VQ48fuxGste/bf/Psn84JkfZ3k1Ijs8W90LIRnQKBgQDOS9frlKd270LFt/Er\nl6PXGKQoc+fCwPqBv0om615IiZ3oSULm9O/Q0FUkDPoPMoPUelh7Niqqpz0/fifL\nnfZ4Ano+T/RV37Vtr2fIHaWQo9LdrAZzV2vFa4fz+Nq7Zc7nyu2XHXB8OfNpdc1m\nMBnp5Sz20KyilPkWH+DTM0KDCwKBgQC/B+LLtVahxrCktLxNzCyhFEjDQ1ecI10W\nKCRo0fLQcnGo+vNB2U+ittj+5Ube5TMyDhzbvRL6YHbruLctexC/m+28JP+dUTbw\nXPfNizfk/mDCg8wms1VUV+1/vHG17gHnb7JCIoaP8VIgBvrx6UVjwCfvYVfDYdp8\ngicFtXuX7QKBgG4ylWSCQ/KEXGbBm1Jt7lc4EniJcYPXEfm89R9VG0gkOvWaLOKy\ndGhW4SQgynLTyRf3QsyOYrxGGbGQ8jEScFYq/KHMk/hLR98Pk6CSNZ7N5BYFjmyO\nhkMu7bClfjIccCnhfIj8cNnrGtt60f2ENFN82Ef/sDgo2+W1oaMv/peBAoGAAyUn\nF8GBjqJN0DhljUZaScCivgxCygBPDQlWKB+kxsfLlUOkc6YXSI+IHRI7S3oskJto\n4DlJsbOa4aCl62rGSNFRZbKaPsXSiLyPG+Q55FxHzYwL9WsocX4NG/hHSv6DK4NM\nRQh6fK41cu+KfCciDFViku9gWYgn57rg15g4U7UCgYEAv5L15v/TjEL60fXfG8iu\nqT98D+lXaxGl9PBgQY4/4xTTPEzP3Pp9xela3WlYmYDkLVS0NyatKbVTdh4fNcXa\nYPBTu7+h74WfF6smnvMfJ4MPUNACTeHaMshezFT/KkQBX4mEw43ESEEifNmsgcAf\nJUyU8Jab3Hej4KuM482Jj1Y=\n-----END PRIVATE KEY-----\n",
      "client_email": "sertech@rock-verbena-359222.iam.gserviceaccount.com",
      "client_id": "104879823106576939121",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sertech%40rock-verbena-359222.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"  
    });
    final client = await clientViaServiceAccount(
      credentials,
      ['https://www.googleapis.com/auth/cloud-platform']
    ); 

    String bucketName = 'sertech';
    String folderName = '';

    if( photoType is UserPhotoType){
      folderName = photoType.path;

    }

    if( photoType is DrivePhotoType){
      folderName = photoType.path;
    }

    final fileName = '$folderName/${file.uri.pathSegments.last}';

    final response = await http.post(
      Uri.parse('https://storage.googleapis.com/upload/storage/v1/b/$bucketName/o?uploadType=media&name=$fileName'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${client.credentials.accessToken.data}',
        HttpHeaders.contentTypeHeader: 'application/octet-stream',
      },
      body: file.readAsBytesSync(),
    );

    if (response.statusCode == 200) {
      final responseModel = uploadFileResponseModelFromJson(response.body);
      return responseModel;
    }
    return null;

  }
  
  @override
  Future<void> logout() async {

    await _auth.signOut();

  }
  
}