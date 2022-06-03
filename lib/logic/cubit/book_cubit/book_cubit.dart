import 'package:bloc/bloc.dart';
import 'package:book_your_flight/data/http/http_services.dart';
import 'package:book_your_flight/data/models/booking.dart';
import 'package:book_your_flight/data/models/byf_user.dart';
import 'package:book_your_flight/data/shared/shred_services.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/flight.dart';
import '../../../data/models/passenger.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  double getPrice(String seatClass, Flight flight, int count) {
    if (seatClass == "economy") {
      return flight.economy_fare * count;
    }
    if (seatClass == "business") {
      return flight.business_fare * count;
    }
    if (seatClass == "first") {
      return flight.first_fare * count;
    }
    return 0.00;
  }

  Future book({
    required Flight flight,
    required String seatClass,
    required List<Passenger> passengers,
  }) async {
    try {
      emit(BookLoading());
      final int uid = await SharedServices.getUid();
      final BYFUser user = await HTTPServices.getUserById(id: uid);
      List<int> passengerIds = [];
      for (Passenger passenger in passengers) {
        passengerIds.add(passenger.id);
      }
      var uuid = const Uuid();
      Booking booking = Booking(
          id: DateTime.now().millisecondsSinceEpoch,
          user: uid,
          ref_no: uuid.v4().substring(0, 4),
          passengers: passengerIds,
          flight: 2,
          flight_ddate: flight.depart_time,
          flight_adate: flight.arrival_time,
          flight_fare: getPrice(seatClass, flight, passengers.length),
          other_charges: 0.0,
          coupon_used: "",
          coupon_discount: 0.0,
          total_fare: getPrice(seatClass, flight, passengers.length),
          seat_class: seatClass,
          booking_date: DateTime.now().toString(),
          mobile: "+94719505180",
          email: user.email,
          status: "PENDING");
      final Booking newBooking = await HTTPServices.book(booking: booking);
      emit(BookSucceed());
    } catch (e) {
      emit(BookFailed(errorMsg: e.toString()));
    }
  }
}
