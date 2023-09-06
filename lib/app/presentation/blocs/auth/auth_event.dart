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

class StartValidation extends AuthEvent{}

class DoLoginEvent extends AuthEvent{}

class DoLogoutEvent extends AuthEvent{}

class ChangeStateCarouselEvent extends AuthEvent{
  final bool state;
  const ChangeStateCarouselEvent(this.state);
}

class SaveContactDetailEvent extends AuthEvent{
  final IUser user;
  const SaveContactDetailEvent(this.user);
}


class SaveDriveDetailEvent extends AuthEvent{
  final Drive drive;
  const SaveDriveDetailEvent(this.drive);
}

class SavePayoutDetailEvent extends AuthEvent{
  final Payout payout;
  const SavePayoutDetailEvent(this.payout);
}

