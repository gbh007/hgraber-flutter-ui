import 'package:hgraber_ui/features/book/bloc/model.dart';

sealed class BookScreenState {}

class BookScreenLoadingState extends BookScreenState {}

class BookScreenLoadedState extends BookScreenState {
  final Book book;

  BookScreenLoadedState(this.book);
}

class BookScreenErrorState extends BookScreenState {
  final String message;

  BookScreenErrorState(this.message);
}
