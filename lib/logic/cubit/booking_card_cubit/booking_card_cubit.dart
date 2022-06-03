import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/flight.dart';
import '../../../data/models/passenger.dart';

part 'booking_card_state.dart';

class BookingCardCubit extends Cubit<BookingCardState> {
  BookingCardCubit() : super(BookingCardInitial());

  Future loadBookingCard(
      {required int flightId, required List<int> passengerIds}) async {
    try {
      emit(BookingCardLoading());
      final Flight flight = await HTTPServices.getFlightById(id: flightId);
      List<Passenger> passengers = [];
      for (int passengerId in passengerIds) {
        final Passenger passenger =
            await HTTPServices.getPassengerById(id: passengerId);
        passengers.add(passenger);
      }
      emit(BookingCardLoaded(flight: flight, passengers: passengers));
    } catch (e) {
      emit(BookingCardLoading());
    }
  }
}
