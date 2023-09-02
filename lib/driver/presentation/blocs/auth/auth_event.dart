part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class VerifyPhoneNumberEvent extends AuthEvent{
  final String phoneNumber;
  const VerifyPhoneNumberEvent(this.phoneNumber);
}

class ConfirmVerificationCode extends AuthEvent{
  final String codeNumber;
  const ConfirmVerificationCode(this.codeNumber);
}

class DoLoginEvent extends AuthEvent{}

class DoLogoutEvent extends AuthEvent{}