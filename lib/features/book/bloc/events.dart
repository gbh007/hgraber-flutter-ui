sealed class BookScreenEvent {}

class LoadingBookEvent extends BookScreenEvent {
  final int id;

  LoadingBookEvent(this.id);
}

class RateBookEvent extends BookScreenEvent {
  final int id, rating;

  RateBookEvent(this.id, this.rating);
}

class RateBookPageEvent extends BookScreenEvent {
  final int id, rating, pageNumber;

  RateBookPageEvent(this.id, this.pageNumber, this.rating);
}
