import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/driver/domain/usescase/sending_otp.dart';
import 'package:taxi/driver/domain/usescase/verifing_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final SendingOTP sendingOTP;
  final VerifingOTP verifyingOTP;
  
  int stepSelected = 0;
  String? verification;
  String phone="";

  AuthBloc(this.sendingOTP, this.verifyingOTP) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if( event is SendOTPEvent ) {
        print(event.phoneNumber);
        emit(SendingOTPState());
        await sendingOTP(
          event.phoneNumber,
          (PhoneAuthCredential phoneAuthCredential) async {},
          (FirebaseAuthException e) async {},
          (String verificationId, int? resendToken) async {
            verification = verificationId;
            print(verification);       
          },
          (String verificationId){
            print(verificationId);
          },
        );
        phone = event.phoneNumber;
        stepSelected = stepSelected + 1;
        emit(SendedOTPState());
      }

      if( event is VerifyOTPEvent ) {
        print(event.codeNumber);
        emit(VerifyingOTPState());
        await verifyingOTP(event.codeNumber, verification??'');
        stepSelected = stepSelected + 1;
        emit(VerifiedOTPState());
      }

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
