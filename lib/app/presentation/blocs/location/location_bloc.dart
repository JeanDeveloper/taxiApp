import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/app/domain/usecases/geting_location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  final GetingLocation getingLocation;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition cameraPosition;
  StreamSubscription<Position>? positionStream ;

  Set<Marker> markers = const <Marker>{};

  LocationBloc(this.getingLocation) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {

      if( event is GetLocationEvent){
        emit(LocationLoading());
        final positions = await getingLocation();
        emit(_failureOrPosition(positions));
      }

    });
  }

}

LocationState _failureOrPosition(Either<Failure, Position> failureOrPosition){
  return failureOrPosition.fold(
    (failure)  => LocationError( _mapFailureToMessage(failure) ), 
    (positionTemp) {
      return LocationLoaded(positionTemp);
    }
  );
}

String _mapFailureToMessage( Failure failure ){
  switch (failure.runtimeType) {
    case LocationFailure:
      return failure.message;
    case ServerFailure:
      return failure.message;
    case AuthFailure:
      return failure.message;
    default:
      return "Error inesperado";
  }
}
