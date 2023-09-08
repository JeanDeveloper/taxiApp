import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi/app/domain/entities/drive.dart';
import 'package:taxi/app/domain/entities/driver.dart';
import 'package:taxi/app/domain/entities/iuser.dart';
import 'package:taxi/app/domain/entities/payout.dart';
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
  Drive? drive;
  Payout? payout;
  XFile? photoProfile;
  XFile? photoDocument;
  XFile? photoLicense;
  XFile? photoCardOwner;


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
        final result = await sendingOTP(
          event.phoneNumber,
          (PhoneAuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          (FirebaseAuthException e)  {
            print(e.message);
          },
          (String verificationId, int? resendToken) {
            verification = verificationId;
          },
          (String verificationId){
            print(verificationId);
          },
        );
        phone = event.phoneNumber;
        stepSelected = stepSelected + 1;
        emit( SendedOTPState() );
      }

      if( event is VerifyOTPEvent ) {
        emit(VerifyingOTPState());
        final UserCredential? userTemp = await verifyingOTP( event.codeNumber, verification ?? '' );
        final IUser usuario = Driver(
          uid: userTemp!.user!.uid,
          phone: userTemp.user!.phoneNumber,
        );
        user = usuario;

        if( userTemp.additionalUserInfo!.isNewUser ){
          stepSelected = stepSelected + 1;
          emit( VerifiedOTPState()) ;
        } else {
          AuthLoged(usuario);
        }
      }

      if( event is SaveContactDetailEvent ) {
        stepSelected = stepSelected + 1;
        emit( SavedContactDetalState() ) ;
      }

      if( event is SaveDriveDetailEvent ) {
        drive = event.drive;
        stepSelected = stepSelected + 1;
        emit( SavedDriveDetalState() ) ;
      }

      if( event is SavePayoutDetailEvent ) {
        payout = event.payout;
        stepSelected = stepSelected + 1;
        emit( SavedPayoutDetalState() ) ;
      }

      if( event is UploadDocEvent ){

        await Future.delayed(const Duration(seconds: 2));
        emit( AuthLoged(user!) ) ;
        //METODO PARA GUARDAR LAS IMAGENES PRIEMRO Y LUEGO LAS RUTAS LAS AGREGAMOS EN LOS OBJETOS.

      }

    });
  }

}
