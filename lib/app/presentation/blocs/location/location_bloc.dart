import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/app/domain/repositories/ilocation_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ILocationRepository iLocationRepository;
 
  LocationBloc(this.iLocationRepository) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {

      if( event is GetLocationEvent){

        emit(LocationLoading());

        final positions = await iLocationRepository.getCurrentLocation();

        emit(_failureOrPosition( positions ));

      }




    });
  }
}

  LocationState _failureOrPosition(Either<Failure, Position> failureOrPosition){
    return failureOrPosition.fold(
      (failure) => LocationError(_mapFailureToMessage(failure)), 
      (position) {
        return LocationLoaded(position);
      }
    );
  }

  String _mapFailureToMessage( Failure failure ){
    switch (failure.runtimeType) {
      case LocationFailure:
        return failure.message;
      case ServerFailure:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      case AuthFailure:
        return failure.message;
      default:
        return "Error inesperado";
    }
  }
