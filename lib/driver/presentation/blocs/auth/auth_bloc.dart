import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi/driver/domain/usescase/verify_number.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final VerifyNumber verifyNumber;
  int stepSelected = 0;

  AuthBloc(this.verifyNumber) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {

      if( event is VerifyPhoneNumberEvent ) {
        print(event.phoneNumber);
        emit(PhoneVerifying());
        //IRA EL METODO PARA EL ESTABILIZADOR 
        await verifyNumber(event.phoneNumber);
        stepSelected = stepSelected + 1;
        emit(PhoneVerified());
      }

      if( event is ConfirmVerificationCode ) {
        print(event.codeNumber);
        emit(PhoneConfirming());
        await Future.delayed(const Duration(seconds: 3));
        stepSelected = stepSelected + 1;
        emit(PhoneConfirmed());
      }

    });
  }

}
