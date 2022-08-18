// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/data.dart';
import '../../data/repositories/techcrunch_repository.dart';

part 'techcrunch_event.dart';
part 'techcrunch_state.dart';

class TechcrunchBloc extends Bloc<TechcrunchEvent, TechcrunchState> {
  TechCrunchRepository techCrunchRepository;

  int pages = 1;
  bool isFetching = false;
  TechcrunchBloc({
    required this.techCrunchRepository,
  }) : super(TechcrunchInitial()) {
    on<TechcrunchEvent>((event, emit) async {
      if (event is TechcrunchEvent) {
        emit(TechcrunchLoadingState());
      }
      try {
        List<TechcrunchData> techcrunch_data =
            await techCrunchRepository.getproducts(pages: pages);
        pages++;
        emit(TechCrunchLoadedState(techcrunchData: techcrunch_data));
      } catch (e) {
        emit(TechCrunchErrorState(message: e.toString()));
      }
    });
  }
}
