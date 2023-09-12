import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi/app/core/errors/failure.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/usecases/get_colors.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final GetColors getColors;

  ColorBloc(this.getColors) : super(ColorInitial()) {
    on<ColorEvent>((event, emit) async{


      if( event is GetColorEvent) {
        emit(ColorLoading());
        final failureOrModel =  await getColors();
        emit(_failureOrColors(failureOrModel));
      }

    });
  }
}


  ColorState _failureOrColors(Either<Failure, List<ColorVehicle>> failureOrColors){
    return failureOrColors.fold(
      (failure) => ColorError(_mapFailureToMessage(failure)), 
      (response) {
        List<ColorVehicle> colors = response;  
        return ColorLoaded(colors);
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