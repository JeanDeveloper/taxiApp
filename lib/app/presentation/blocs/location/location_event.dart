part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();
  @override
  List<Object> get props => [];
}

final class GetLocationEvent extends LocationEvent {
}

final class SaveLocationEvent extends LocationEvent {
  Driver user;
  Position pos;
  SaveLocationEvent(this.user, this.pos);
}

final class OffOrOnEvent extends LocationEvent {
  const OffOrOnEvent();
}