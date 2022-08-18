part of 'techcrunch_bloc.dart';

abstract class TechcrunchEvent extends Equatable {
  const TechcrunchEvent();

  @override
  List<Object> get props => [];
}

class FetchTechcrunchEvents extends TechcrunchEvent {}
