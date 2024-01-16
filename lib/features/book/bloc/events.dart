sealed class BookScreenEvent {}

class LoadingBookEvent extends BookScreenEvent {
  final int id;

  LoadingBookEvent(this.id);
}

class RateBookEvent extends BookScreenEvent {
  final int id, rate;

  RateBookEvent(this.id, this.rate);
}

class RateBookPageEvent extends BookScreenEvent {
  final int id, rate, pageNumber;

  RateBookPageEvent(this.id, this.pageNumber, this.rate);
}
