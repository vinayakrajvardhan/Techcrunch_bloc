// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'techcrunch_bloc.dart';

abstract class TechcrunchState extends Equatable {
  const TechcrunchState();

  @override
  List<Object> get props => [];
}

class TechcrunchInitial extends TechcrunchState {}

//Four states while calling Api
class TechcrunchLoadingState extends TechcrunchState {}

class TechCrunchLoadedState extends TechcrunchState {
  final List<TechcrunchData> techcrunchData;
  TechCrunchLoadedState({
    required this.techcrunchData,
  });
}

class TechCrunchErrorState extends TechcrunchState {
  final String message;
  TechCrunchErrorState({
    required this.message,
  });
}
