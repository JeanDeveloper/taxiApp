part of 'model_bloc.dart';

sealed class ModelEvent extends Equatable {
  const ModelEvent();

  @override
  List<Object> get props => [];
}


class GetModelEvent extends ModelEvent{}
