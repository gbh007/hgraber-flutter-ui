import 'package:hgraber_ui/features/book_list/bloc/model.dart';

sealed class BookListScreenState {}

class BookListScreenLoadingState extends BookListScreenState {}

class BookListScreenLoadedState extends BookListScreenState {
  final List<Book> books;
  final List<BooksPage> pages;
  final int count, page;

  BookListScreenLoadedState(
    this.books,
    this.count,
    this.page,
    this.pages,
  );
}

class BookListScreenErrorState extends BookListScreenState {
  final String message;
  final int count, page;

  BookListScreenErrorState(this.message, this.count, this.page);
}
