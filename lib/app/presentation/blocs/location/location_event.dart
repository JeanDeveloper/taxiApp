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

final class RemoveLocationEvent extends LocationEvent {
  String id;
  RemoveLocationEvent(this.id);
}

final class OnOrOffEvent extends LocationEvent {
  final Driver driver;
  final Position pos;
  const OnOrOffEvent( this.driver, this.pos );
}