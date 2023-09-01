part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class PhoneVerifying extends AuthState{}

final class PhoneVerified extends AuthState{}

final class PhoneConfirming extends AuthState{}

final class PhoneConfirmed extends AuthState{}

final class AuthLoading extends AuthState{}

final class AuthLoged extends AuthState{}

final class AuthError extends AuthState{
  final String message;
  const AuthError(this.message);
}
