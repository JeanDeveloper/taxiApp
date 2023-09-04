part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class SendOTPEvent extends AuthEvent{
  final String phoneNumber;
  const SendOTPEvent(this.phoneNumber);
}

class VerifyOTPEvent extends AuthEvent{
  final String codeNumber;
  const VerifyOTPEvent(this.codeNumber);
}

class DoLoginEvent extends AuthEvent{}

class DoLogoutEvent extends AuthEvent{}
