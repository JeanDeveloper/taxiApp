part of 'as_bloc.dart';

sealed class AsState extends Equatable {
  const AsState();
  
  @override
  List<Object> get props => [];
}

final class AsInitial extends AsState {}
