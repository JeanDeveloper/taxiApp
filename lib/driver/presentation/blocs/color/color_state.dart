part of 'color_bloc.dart';

sealed class ColorState extends Equatable {
  const ColorState();
  
  @override
  List<Object> get props => [];
}

final class ColorInitial extends ColorState {}

final class ColorLoading extends ColorState {}

final class ColorLoaded extends ColorState {
  final List<ColorVehicle> colorVehicle;
  const ColorLoaded(
    this.colorVehicle, 
  );
}

class ColorError extends ColorState{
  final String message;
  const ColorError(this.message);
}

