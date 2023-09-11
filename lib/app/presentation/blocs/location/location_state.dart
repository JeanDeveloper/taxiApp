part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();
  
  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final Position pos;
  const LocationLoaded(this.pos);
}

final class LocationError extends LocationState {
  final String errorMessage;
  const LocationError(this.errorMessage);
}
