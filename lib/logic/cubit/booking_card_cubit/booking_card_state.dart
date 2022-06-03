part of 'booking_card_cubit.dart';

@immutable
abstract class BookingCardState {}

class BookingCardInitial extends BookingCardState {}

class BookingCardLoading extends BookingCardState {}

class BookingCardLoaded extends BookingCardState {
  final Flight flight;
  final List<Passenger> passengers;
  BookingCardLoaded({
    required this.flight,
    required this.passengers,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingCardLoaded &&
        other.flight == flight &&
        listEquals(other.passengers, passengers);
  }

  @override
  int get hashCode => flight.hashCode ^ passengers.hashCode;

  @override
  String toString() =>
      'BookingCardLoaded(flight: $flight, passengers: $passengers)';
}
