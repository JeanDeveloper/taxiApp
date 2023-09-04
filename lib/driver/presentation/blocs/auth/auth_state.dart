part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class SendingOTPState extends AuthState{}

final class SendedOTPState extends AuthState{}

final class VerifyingOTPState extends AuthState{}

final class VerifiedOTPState extends AuthState{}

final class AuthLoading extends AuthState{}

final class AuthLoged extends AuthState{}

final class AuthError extends AuthState{
  final String message;
  const AuthError(this.message);
}
