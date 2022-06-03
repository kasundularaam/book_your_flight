part of 'bookings_cubit.dart';

@immutable
abstract class BookingsState {}

class BookingsInitial extends BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<Booking> bookings;
  BookingsLoaded({
    required this.bookings,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingsLoaded && listEquals(other.bookings, bookings);
  }

  @override
  int get hashCode => bookings.hashCode;

  @override
  String toString() => 'BookingsLoaded(bookings: $bookings)';
}

class BookingsFailed extends BookingsState {
  final String errorMsg;
  BookingsFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingsFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'BookingsFailed(errorMsg: $errorMsg)';
}
