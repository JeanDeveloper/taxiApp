import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/app/domain/entities/iuser.dart';
import 'package:taxi/app/domain/usecases/get_state_carousel.dart';
import 'package:taxi/app/domain/usecases/get_user.dart';
import 'package:taxi/app/domain/usecases/save_state_carousel.dart';
import 'package:taxi/app/domain/usecases/sending_otp.dart';
import 'package:taxi/app/domain/usecases/verifing_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final SendingOTP sendingOTP;
  final VerifingOTP verifyingOTP;
  final GetUser getUser;
  final GetStateCarousel getStateCarousel;
  final SaveStateCarousel saveStateCarousel;
  
  int stepSelected = 0;
  String? verification;
  String phone="";
  IUser? user;

  AuthBloc(
    this.sendingOTP, 
    this.verifyingOTP, 
    this.getUser, 
    this.getStateCarousel,
    this.saveStateCarousel
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {

      if( event is StartValidation ){
        final userTemp = await getUser();
        if( userTemp != null ){
          user = userTemp;
          emit(AuthLoged(userTemp));
        }else{
          bool isViewCarousel = await getStateCarousel();
          emit(AuthUnvalidated(isViewCarousel));
        }
      }

      if( event is ChangeStateCarouselEvent ){
        await saveStateCarousel(event.state);
      }

      if( event is SendOTPEvent ) {
        print(event.phoneNumber);
        emit(SendingOTPState());
        await sendingOTP(
          event.phoneNumber,
          (PhoneAuthCredential phoneAuthCredential) async {
            print(phoneAuthCredential);
          },
          (FirebaseAuthException e) async {
            print(e.message);

          },
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
        await verifyingOTP( event.codeNumber, verification ?? '' );
        
        
        
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
