import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/app/domain/entities/driver.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/app/domain/usecases/geting_location.dart';
import 'package:taxi/driver/domain/usecases/register_location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  final GetingLocation  getingLocation;
  final RegisterLocation registerLocation;
  GlobalKey<ScaffoldState> key  = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition cameraPosition;
  StreamSubscription<Position>? positionStream ;
  Set<Marker> markers = const <Marker>{};
  bool isOnline = false;

  LocationBloc(this.getingLocation, this.registerLocation) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {

      if( event is GetLocationEvent){
        emit(LocationLoading());
        final positions = await getingLocation();
        emit(await _failureOrPosition(positions));
      }

      if( event is SaveLocationEvent){
        final user = event.user;
        final position = event.pos;
        final jeanresponse = await registerLocation(user.uid, position.latitude, position.longitude);
      }

      if( event is OffOrOnEvent){
        isOnline = !isOnline;        
      }


    });
  }

  LocationState? _failureOrVoid(Either<Failure, void> failureOrVoid){
    return failureOrVoid.fold(
      (failure)  => LocationError( _mapFailureToMessage(failure) ), 
      (positionTemp) {

      }
    );
  }


  Future<LocationState> _failureOrPosition(Either<Failure, Position> failureOrPosition)async {
    return failureOrPosition.fold(
      (failure)  => LocationError( _mapFailureToMessage(failure) ), 
      (positionTemp) async {
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
      case GeneralFailure:
        return failure.message;
      default:
        return "Error inesperado";
    }
  }

}
