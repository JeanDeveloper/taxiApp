import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/driver/domain/usescase/verify_number.dart';
import 'package:taxi/driver/domain/usescase/verify_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  // fincal VerifyNumber verifyNumber;
  final VerifyOTP verifyOTP;
  int stepSelected = 0;

  AuthBloc(this.verifyOTP) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      final firebaseAuth = FirebaseAuth.instance;
      if( event is VerifyPhoneNumberEvent ) {
        print(event.phoneNumber);
        emit(PhoneVerifying());
        //IRA EL METODO PARA EL ESTABILIZADOR 
        // await verifyNumber(event.phoneNumber);

        await verifyOTP(

          event.phoneNumber,

          (PhoneAuthCredential credential) async {
            // ANDROID ONLY!
            // Sign the user in (or link) with the auto-generated credential
            print("verificacion completada");
            await firebaseAuth.signInWithCredential(credential);

          },

          (FirebaseAuthException e){
            if(e.code == 'invalid-phone-number'){
              print("Numero incorrecto ${e.message}");
            }
            print("codigo del fallo: ${e.message}");
          },

          (String verificationId, int? resendToken) async {
            stepSelected = stepSelected + 1;
            emit(PhoneVerified());
            print("Se envio el codigo exitosamente");
            // Update the UI - wait for the user to enter the SMS code
            String smsCode = '123456';

            // Create a PhoneAuthCredential with the code
            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

              // Sign the user in (or link) with the credential
            await firebaseAuth.signInWithCredential(credential);

          },
          (String verificationId){
            print(verificationId);
          },
        

        );

      }


      // if( event is VerifyPhoneNumberEvent ) {
      //   print(event.phoneNumber);
      //   emit(PhoneVerifying());
      //   //IRA EL METODO PARA EL ESTABILIZADOR 
      //   await verifyNumber(event.phoneNumber);
      //   stepSelected = stepSelected + 1;
      //   emit(PhoneVerified());
      // }

      // if( event is ConfirmVerificationCode ) {
      //   print(event.codeNumber);
      //   emit(PhoneConfirming());
      //   await Future.delayed(const Duration(seconds: 3));
      //   stepSelected = stepSelected + 1;
      //   emit(PhoneConfirmed());
      // }

    });
  }

}
