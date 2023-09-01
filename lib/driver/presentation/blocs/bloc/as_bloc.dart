import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'as_event.dart';
part 'as_state.dart';

class AsBloc extends Bloc<AsEvent, AsState> {
  AsBloc() : super(AsInitial()) {
    on<AsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
