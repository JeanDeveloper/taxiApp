part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Position pos;
  const LocationLoaded(this.pos);
}

class LocationError extends LocationState {
  final String errorMessage;
  const LocationError(this.errorMessage);
}
