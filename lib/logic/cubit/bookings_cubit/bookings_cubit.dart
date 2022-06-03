import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/booking.dart';

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
