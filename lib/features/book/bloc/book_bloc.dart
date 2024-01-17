import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/features/book/bloc/model.dart';
import 'states.dart';
import 'events.dart';
import 'package:hgraber_ui/repository/repository.dart' show Repository;

class BookScreenBloc extends Bloc<BookScreenEvent, BookScreenState> {
  final Repository _repository;

  BookScreenBloc(this._repository) : super(BookScreenLoadingState()) {
    on<LoadingBookEvent>((event, emit) async {
      emit(BookScreenLoadingState());
      try {
        final model = await _repository.book(event.id);
        emit(BookScreenLoadedState(Book(
          info: BookInfo(
            id: model.id,
            created: model.created,
            parsedName: model.parsedName,
            name: model.name,
            parsedPage: model.parsedPage,
            pageCount: model.pageCount,
            pageLoadedPercent: model.pageLoadedPercent,
            rating: model.rating,
          ),
          name: model.name,
          attributes: model.attributes != null
              ? model.attributes!
                  .map((attr) => BookAttribute(
                        name: attr.name,
                        values: attr.values,
                      ))
                  .toList()
              : List.empty(),
          previewUrl: model.previewUrl,
          pages: model.pages != null
              ? model.pages!
                  .map((page) => BookPagePreview(
                        pageNumber: page.pageNumber,
                        rating: page.rating,
                        previewUrl: page.previewUrl,
                      ))
                  .toList()
              : List.empty(),
        )));
      } catch (e) {
        emit(BookScreenErrorState(e.toString()));
      }
    });
    on<RateBookEvent>((event, emit) async {
      try {
        await _repository.updateBookRating(event.id, event.rating);
        add(LoadingBookEvent(event.id));
      } catch (e) {
        emit(BookScreenErrorState(
          e.toString(),
        ));
      }
    });
    on<RateBookPageEvent>((event, emit) async {
      try {
        await _repository.updatePageRating(
            event.id, event.pageNumber, event.rating);
        add(LoadingBookEvent(event.id));
      } catch (e) {
        emit(BookScreenErrorState(
          e.toString(),
        ));
      }
    });
  }
}
