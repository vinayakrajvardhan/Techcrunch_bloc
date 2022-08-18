import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../data/model/data.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    on<BookmarkEvent>((event, emit) {
      if (event is BookMarkEventImp) {
        final List<TechcrunchData> _wishList = [];
        void wishListData(num data) {}
        emit(BookmarkLoaded(id: 1, techBookMarkData: _wishList));
      }
    });
  }
}
