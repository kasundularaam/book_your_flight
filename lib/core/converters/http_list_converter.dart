import 'dart:convert';

import '../../data/models/booking.dart';
import '../../data/models/flight.dart';
import '../../data/models/passenger.dart';
import '../../data/models/place.dart';

class HTTPListConverter {
  static List<Place> parsePlaces(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Place>(
          (json) => Place.fromMap(json),
        )
        .toList();
  }

  static List<Flight> parseFlights(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Flight>(
          (json) => Flight.fromMap(json),
        )
        .toList();
  }

  static List<Passenger> parsePassengers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Passenger>(
          (json) => Passenger.fromMap(json),
        )
        .toList();
  }

  static List<Booking> parseBookings(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Booking>(
          (json) => Booking.fromMap(json),
        )
        .toList();
  }
}
