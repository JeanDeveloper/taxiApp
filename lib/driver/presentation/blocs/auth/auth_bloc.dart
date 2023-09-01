import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  int stepSelected = 0;

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {

      if( event is VerifyPhoneNumberEvent) {
        print(event.phoneNumber);
        emit(PhoneVerifying());
        await Future.delayed(const Duration(seconds: 3));
        stepSelected = stepSelected + 1;
        emit(PhoneVerified());
      }

    });
  }

}
