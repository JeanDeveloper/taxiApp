part of 'model_bloc.dart';

sealed class ModelState extends Equatable {
  const ModelState();
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends ModelState {}

final class RegisterLoading extends ModelState {}

final class RegisterLoaded extends ModelState {

  final List<ModelVehicle> modelVehicle;

  const RegisterLoaded(
    this.modelVehicle,
  );

}

class RegisterError extends ModelState{
  final String message;
  const RegisterError(this.message);
}

