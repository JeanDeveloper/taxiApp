part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();
  
  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}


class LocationLoading extends LocationState {}


class LocationLoaded extends LocationState {
  final Position position;

  const LocationLoaded(this.position);
}


class LocationError extends LocationState {
  final String errorMessage;

  const LocationError(this.errorMessage);
}
