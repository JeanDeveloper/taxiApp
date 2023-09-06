import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';
import 'package:taxi/driver/domain/usecases/get_models.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {

  final GetModels getModels;

  ModelBloc(this.getModels) : super(RegisterInitial()) {

    on<ModelEvent>((event, emit) async {

      if( event is GetModelEvent){

        emit(RegisterLoading());
        final failureOrModel =  await getModels();
        emit(_failureOrModels(failureOrModel));

      }

    });

  }
}

  ModelState _failureOrModels(Either<Failure, List<ModelVehicle>> failureOrBrands){
    return failureOrBrands.fold(
      (failure) => RegisterError(_mapFailureToMessage(failure)), 
      (loginResponse) {
        List<ModelVehicle>models = loginResponse;  
        return RegisterLoaded(models);
      }
    );
  }

  String _mapFailureToMessage( Failure failure ){
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      case AuthFailure:
        return failure.message;
      default:
        return "Error inesperado";
    }
  }