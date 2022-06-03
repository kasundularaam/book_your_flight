import 'package:bloc/bloc.dart';
import 'package:book_your_flight/data/http/http_services.dart';
import 'package:book_your_flight/data/models/booking.dart';
import 'package:flutter/foundation.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit() : super(BookingsInitial());

  Future loadBookings() async {
    try {
      emit(BookingsLoading());
      final List<Booking> bookings = await HTTPServices.bookings();
      emit(BookingsLoaded(bookings: bookings));
    } catch (e) {
      emit(BookingsFailed(errorMsg: e.toString()));
    }
  }
}
