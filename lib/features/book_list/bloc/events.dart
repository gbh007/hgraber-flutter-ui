sealed class BookListScreenEvent {}

class LoadingBooksEvent extends BookListScreenEvent {
  final int count, page;

  LoadingBooksEvent(this.count, this.page);
}

class RateBookEvent extends BookListScreenEvent {
  final int count, page, bookID, rate;

  RateBookEvent(this.count, this.page, this.bookID, this.rate);
}
